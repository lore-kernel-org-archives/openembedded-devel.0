Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OzoCd-0003UO-0z
	for openembedded-devel@openembedded.org; Sun, 26 Sep 2010 12:11:27 +0200
Received: by iwn2 with SMTP id 2so1980023iwn.6
	for <openembedded-devel@openembedded.org>;
	Sun, 26 Sep 2010 03:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=cUNVwJWce3GlQ81zM3T4Pu4mid0CfWxIhrnj/YY52yk=;
	b=lnAUyjUTNO6d+/grgbjwGu1mJ4yKWK8y0iycDWpGMh7rn3XwDUM2IOeRLDs3kTD3D8
	gxnWZ32TWU6IC/9rhRJPxT3AadciSh/SMMaJ1c/onPR3O2vRS3h0ShAE9kYrly3crCsV
	f7KdlUCWPWs0o6Tf65Ye+kpU7/rYUBF19SbK8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=d3URd5FBdLMlaERTOUZg2g1kiLX5hkMAchw+M3GRjFtsnL3bgPW5wr+Rn1WkSmpfQY
	7ImBuLZXDQoPJ8UBkNNMAFMrqst8ckmeayjNUD4LQtCCqcH0IgRGyEnx7CgE1ZULKakM
	jlfI78PYrpoH9GdUcOABZ9DQYw63rZZtrXZx0=
MIME-Version: 1.0
Received: by 10.231.59.212 with SMTP id m20mr6968942ibh.130.1285495877812;
	Sun, 26 Sep 2010 03:11:17 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sun, 26 Sep 2010 03:11:17 -0700 (PDT)
Date: Sun, 26 Sep 2010 12:11:17 +0200
Message-ID: <AANLkTik0YeVkfu9ZJn7QO6cZ-MvjUfcC-Tm_4WzEEjjP@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: uclibc: fetch errors
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
X-List-Received-Date: Sun, 26 Sep 2010 10:11:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I want to report fetch errors for uclibc.
This is with bitbake git head from sep 25 and oe head from sep 26.

None of the recipes seems to fetch
partly this is due to SRC_URI referring to
http://www.uclibc.org/downloads/uClibc-${PV}.tar.bz2;name=uClibc-${PV}
\
whereas for pre 0.30 versions the src is
in:http://www.uclibc.org/downloads/old-releases/
this is included in an .inc file which is used by both 0.30 and older versions.
solution is probably to move the SRC_URI to the recipe, and adapt where needed

Weird thing is that the .30 and .31 recipes do not fetch either:

frans@linux-suse:~/oe/openembedded/recipes/uclibc> bitbake -cfetch -b
uclibc_0.9.31.bb
ERROR: Command execution failed: Traceback (most recent call last):
  File "/home/frans/oe/bitbake/lib/bb/command.py", line 88, in runAsyncCommand
    commandmethod(self.cmds_async, self, options)
  File "/home/frans/oe/bitbake/lib/bb/command.py", line 174, in buildFile
    command.cooker.buildFile(bfile, task)
  File "/home/frans/oe/bitbake/lib/bb/cooker.py", line 650, in buildFile
    self.status.task_deps[fn]['depends'] = {}
TypeError: 'NoneType' object does not support item assignment

No idea what is going on and don't have time to peek into it right now.

Frans.


