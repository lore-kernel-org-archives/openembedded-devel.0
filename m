Received: from [209.85.210.175] (helo=mail-yx0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N6Jyd-0000Lj-04
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Nov 2009 09:15:26 +0100
Received: by yxe5 with SMTP id 5so751384yxe.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Nov 2009 00:14:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=znogQSJKNzWUld+YBEnOsmR2TUsClMuRzTEUT3xfHj8=;
	b=gxAb9avMwCGVHGNI6o6CzpWyEfKA1m/I61Dglm6Qd8XYMi5U8BWynFJEMolWAhyVDa
	+R1oAEWDJC4zprE4ZVs0565LAgfh6Vf5vXi+m4xnGq9gZGNvU+gfXheTdaJG61dTg/0z
	dQgBwByi/tNk3RdaZ3XGsCp9AhADsiZdhC0IY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=C5wpiwlPgQDNHBe6cFKPwBz6ZTm1WuGbm350H/8jpCNWvTBvecFa1/lfdQDQ8kqiw+
	MtKXz+Zb8EP41etblD2yGxSw5nT7oOoZFvt+YQTWYVoet9sUYcbhl71Msrugm+UQm+X5
	nQY/rcxUa8NAyiZtcDM4uCJPWfdY6ikyAKlDQ=
MIME-Version: 1.0
Received: by 10.100.249.3 with SMTP id w3mr3697373anh.118.1257494782179; Fri, 
	06 Nov 2009 00:06:22 -0800 (PST)
Date: Fri, 6 Nov 2009 09:06:22 +0100
Message-ID: <ac9c93b10911060006x1a60e677ic6f2c192eedc176d@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: mysql 5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Nov 2009 08:15:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Over the last few days I created a recipe for mysql 5.1.40 based upon
the mysql 4.1.22 recipe, the nslu2 optware patches
(http://trac.nslu2-linux.org/optware/browser/trunk/sources/mysql5?rev=8339&order=date&desc=1)
and help on irc.

I think the work is done, so I have committed my changes. (commit 35cc93da88)
The package is called mysql5 and resides in the mysql directory

For now it has DEFAULT_PREFERENCE = "-1" for a number of reasons:

- I am not a mysql wiz so I would suggest someone else tests this too
(it works for the use case I have (mythtv))
- I would appeciate it if someone would review the recipe
- if one generates mysql5 the pacakges are named differently from the
ones from mysql 4 (mysql5 package names start with mysql5)
  HOWEVER a lot of filenames are the same. mysql5 requires
mysql5-native so if you build mysql5, some mysql4 files in staging
will be overwritten
- and last but not least: MYSQL5 DATABASES ARE INCOMPATIBLE WITH MYSQL4!
Apparently it is not possible to convert databases directly from 4 to
5.1, so I decided just to discard my databases.
According to the folks in #mysql the solution is to upgrade from 5 via
5.0 to 5.1.
If someone feels attracted to making a 5.0 recipe, be my guest (I've
already spent more time on this than I planned to, then again I also
learned more than I hoped for :-) )

I would like to ask your opinion on this. If possible I would like to
remove the DEFAULT_PREFERENCE in a week or so as mythtv 0.22 needs
mysql5 (and they are different packages)
Maybe it is possible to issue a big warning if someone moves from 4 to
5, but I do not really know how to detect this properly (especially
not in the case someone explicitly uninstalls mysql before installing
mysql5).

Your feedback is appreciated!
Frans

PS: for now the pid file of mysql is in /var/lib/mysql dir, if someone
feels it should live elsewhere let me know (or fix it after
discussion)
(it cannot be in /var/run as the pid file is written by user mysql who
has no write privileges in that dir, and, at least under angstrom,
/var/run links to /var/volatile/run and is created during boot so
/var/run/mysql is also not really an option)


