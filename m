Received: from [72.14.220.154] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1Kl4nz-0003u0-3c
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Oct 2008 18:44:03 +0200
Received: by fg-out-1718.google.com with SMTP id l26so445859fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Oct 2008 09:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=dfJDkxvTwGnd5xo/EvgA1XRFIZWe2SKCYJbnzFrBat4=;
	b=cTi5ByOyNJiUvxlfCOYGa7mabXMwzldJ2v4Pehiw9N75iU10EtcllqH6KU3UV0ZJgc
	IklOsBrgm9UHPOitwsAb/d+SN+3a9N77+2O99NvY4Zh8Pd/i5/tiB7V8LeoiuK8zK6xE
	Se6pnyMwlbxtcAO5fiXXw2aIQHOYbfv+FvxRk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=oig0n1m9A8YbCSoSXvBi5vklQbVpTJvLOYEJ+00rE2pjzQWLoqlvPWFTn20LIgJoQy
	djNdIR/tS7NUqLXexMw/fcWDVud1rRs53/DfMga9nUe3SniYfuz2L23jzn21oEy+n2Hl
	ZIgP+cnT/NZ3ikUsN5Cx3KOnWmwPnnGCHD6fc=
Received: by 10.187.228.6 with SMTP id f6mr1500705far.59.1222879194428;
	Wed, 01 Oct 2008 09:39:54 -0700 (PDT)
Received: by 10.187.224.10 with HTTP; Wed, 1 Oct 2008 09:39:54 -0700 (PDT)
Message-ID: <d1b08f940810010939k66d8abdrc3e7e12075b77562@mail.gmail.com>
Date: Wed, 1 Oct 2008 18:39:54 +0200
From: "Andrea Adami" <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48E39BC1.6080200@dls.net>
MIME-Version: 1.0
References: <48E36C18.4090504@smartlink.ee>
	<873ajglc0d.fsf@neumann.lab.ossystems.com.br>
	<48E3762E.6000203@smartlink.ee>
	<359c5480810010634m377ab993rd030d8c0c917b8b3@mail.gmail.com>
	<gc017m$gq4$1@ger.gmane.org> <48E39BC1.6080200@dls.net>
Subject: Re: git master not updating
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
X-List-Received-Date: Wed, 01 Oct 2008 16:44:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

FYI this was briefly discussed on irc:

http://hentges.net/tmp/logs/irc/%23oe/2008/September/20080926_oe.log
...
[20080926 18:00:51] <mickey|tw>   zecke: did you see my request
regarding combining CIAbot notifications for multiple branches? Would
be a nice thing and reduce clutter
[20080926 18:02:10] <zecke>   mickey|tw: yes, the ciabot runs on
gitweb where I have no access to :)
[20080926 18:02:29] <mickey|tw>   gitweb?
[20080926 18:02:40] <zecke>   mickey|tw: git.openembedded.org
[20080926 18:02:48] <mickey|tw>   oh, there it runs
[20080926 18:02:49] <mickey|tw>   interesting
[20080926 18:03:05] <zecke>   mickey|tw: a) I can stop pushing master.
I did it because it was needed on repo.or.cz
[20080926 18:03:39] <zecke>   mickey|tw: b) someone with access
changes the post commit script to have if [ $branch != "master" ];
then run_cia_script; fi
[20080926 18:04:47] <mickey|tw>   hmm
[20080926 18:04:51] <mickey|tw>   which option do you recommend?
...
20080926 18:15:21] <zecke>   mickey|tw: I will not push master anymore
[20080926 18:16:30] <mickey|tw>   oki, cool
...


