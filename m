Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1P9vDJ-0003gt-OI
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Oct 2010 09:41:59 +0200
Received: by iwn5 with SMTP id 5so1551810iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Oct 2010 00:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=lut17N63s+I9g7uP+26B4fcV/hroKIaPEDcrpHBPcT8=;
	b=nFsUiM9iULvBQF8Yml8XjK4XL6AqZxhkJWWCGtbHI/OjRk+aELUH1fupaPkdis2SZq
	Ltxxgv1cMKEXwn3ByYVPxzUWxWsSPqEgVZ5y/bymeHgFxC1W44oDCgLnSoXYExO2qfWX
	8ykgkezVCZAfyOg+EnC4YkKNIVMm/d9u9GAuU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=mJ3+AUVrKKu9k0IbMJ9brAIgKZvDIq4ZdmjFF/krBZoMZjifw9Zsn0VOe+N6MOZj65
	d9w051qaCUhARt3t0xE6yqqxy5tV9/BXbZcKTEdSC8g3jmrYT6cAKLlSV1HQasQ3xNt5
	6E8sDtTHT3x1Row3dp0ZdkzMB2AnABnF3Y66c=
Received: by 10.42.172.131 with SMTP id n3mr3780840icz.342.1287906076093; Sun,
	24 Oct 2010 00:41:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.42.164.194 with HTTP; Sun, 24 Oct 2010 00:40:56 -0700 (PDT)
In-Reply-To: <AANLkTimhhvUqQZSicuDE7qEHFdxUJjJJSv=ZioFwwdR8@mail.gmail.com>
References: <1285368419-12062-1-git-send-email-raj.khem@gmail.com>
	<AANLkTimhhvUqQZSicuDE7qEHFdxUJjJJSv=ZioFwwdR8@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 24 Oct 2010 00:40:56 -0700
Message-ID: <AANLkTikvA4DOf7uwKUq2myNZMdOPZiOf_B73Kr=USOjZ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: bitbake-dev@lists.berlios.de, openembedded-devel@lists.openembedded.org
Subject: Re: [Bitbake-dev] [PATCH] fetchers: Use tar --exclude pattern to remove SCM files
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
X-List-Received-Date: Sun, 24 Oct 2010 07:41:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 23, 2010 at 11:58 PM, Martin Jansa <martin.jansa@gmail.com> wro=
te:
> This commit is usefull for sure, but breaks ie some EFL recipes.
>
> ie python-elementary depends on elementary >=3D 0.7.0.52890
> but elementary.pc says Version: 0.7.0.0
>
> elementary.pc.in says Version: @VERSION@
>
> and finally VERSION is defined in configure.ac:
> m4_define([v_maj], [0])
> m4_define([v_min], [7])
> m4_define([v_mic], [0])
> m4_define([v_rev], m4_esyscmd([(svnversion "${SVN_REPO_PATH:-.}" |
> grep -v export || echo 0) | awk -F : '{printf("%s\n", $1);}' | tr -d '
> :MSP\n']))
> m4_if(v_rev, [0], [m4_define([v_rev], m4_esyscmd([git log 2> /dev/null
> | (grep -m1 git-svn-id || echo 0) | sed -e 's/.*@\([0-9]*\).*/\1/' |
> tr -d '\n']))])
>

hmm strange that a configure scripts depends on SCM files. To me it
seems wrong. Anyway I think you can patch configure.ac
to replace v_rev definition to be based on SRCREV may be some sort of
sed operation as do_configure_prepend might be a good way



> and this works OK on checkout with .svn dirs included, but results to
> 0 after this patch.
>
> Any hints how to resolve it?
>
> Regards,
>
> On Sat, Sep 25, 2010 at 12:46 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> This option will exclude the SCM metadata from tar files.
>>
>> Tested with gcc where svn tar which used to be 156M for gcc 4.5
>> is now 77M
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0lib/bb/fetch/bzr.py | =C2=A0 =C2=A02 +-
>> =C2=A0lib/bb/fetch/cvs.py | =C2=A0 =C2=A02 +-
>> =C2=A0lib/bb/fetch/git.py | =C2=A0 =C2=A02 +-
>> =C2=A0lib/bb/fetch/hg.py =C2=A0| =C2=A0 =C2=A02 +-
>> =C2=A0lib/bb/fetch/svn.py | =C2=A0 =C2=A02 +-
>> =C2=A05 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/lib/bb/fetch/bzr.py b/lib/bb/fetch/bzr.py
>> index 8b0bd9f..3ca125f 100644
>> --- a/lib/bb/fetch/bzr.py
>> +++ b/lib/bb/fetch/bzr.py
>> @@ -107,7 +107,7 @@ class Bzr(Fetch):
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(ud.pkgdir)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 # tar them up to a defined filename
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0runfetchcmd("tar -czf %s %s" =
% (ud.localpath, os.path.basename(ud.pkgdir)), d)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0runfetchcmd("tar --exclude '.=
bzr' --exclude '.bzrtags' -czf %s %s" % (ud.localpath, os.path.basename(ud.=
pkgdir)), d)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t, v, tb =3D sys.exc_info()
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
>> diff --git a/lib/bb/fetch/cvs.py b/lib/bb/fetch/cvs.py
>> index 1064b09..42d71ba 100644
>> --- a/lib/bb/fetch/cvs.py
>> +++ b/lib/bb/fetch/cvs.py
>> @@ -162,7 +162,7 @@ class Cvs(Fetch):
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 # tar them up to a defined filename
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 if 'fullpath' in ud.parm:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(pkgdir)
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0myret =3D os.system("tar -czf=
 %s %s" % (ud.localpath, localdir))
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0myret =3D os.system("tar --ex=
clude 'CVS' -czf %s %s" % (ud.localpath, localdir))
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(moddir)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir('..')
>> diff --git a/lib/bb/fetch/git.py b/lib/bb/fetch/git.py
>> index 1b1bc95..4acaa87 100644
>> --- a/lib/bb/fetch/git.py
>> +++ b/lib/bb/fetch/git.py
>> @@ -149,7 +149,7 @@ class Git(Fetch):
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(codir)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 logger.info("Creating tarball of git checkou=
t")
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0runfetchcmd("tar -czf %s %s" % (ud.localpat=
h, os.path.join(".", "*") ), d)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0runfetchcmd("tar --exclude '.git' -czf %s %=
s" % (ud.localpath, os.path.join(".", "*") ), d)
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(ud.clonedir)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.prunedir(codir)
>> diff --git a/lib/bb/fetch/hg.py b/lib/bb/fetch/hg.py
>> index ab00d43..9c11deb 100644
>> --- a/lib/bb/fetch/hg.py
>> +++ b/lib/bb/fetch/hg.py
>> @@ -145,7 +145,7 @@ class Hg(Fetch):
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(ud.pkgdir)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0runfetchcmd("tar -czf %s %s" =
% (ud.localpath, ud.module), d)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0runfetchcmd("tar --exclude '.=
hg' --exclude '.hgrags' -czf %s %s" % (ud.localpath, ud.module), d)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t, v, tb =3D sys.exc_info()
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
>> diff --git a/lib/bb/fetch/svn.py b/lib/bb/fetch/svn.py
>> index 34f8132..c236e41 100644
>> --- a/lib/bb/fetch/svn.py
>> +++ b/lib/bb/fetch/svn.py
>> @@ -159,7 +159,7 @@ class Svn(Fetch):
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 os.chdir(ud.pkgdir)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 # tar them up to a defined filename
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0runfetchcmd("tar -czf %s %s" =
% (ud.localpath, ud.module), d)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0runfetchcmd("tar --exclude '.=
svn' -czf %s %s" % (ud.localpath, ud.module), d)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 except:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 t, v, tb =3D sys.exc_info()
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 try:
>> --
>> 1.7.1
>>
>> _______________________________________________
>> Bitbake-dev mailing list
>> Bitbake-dev@lists.berlios.de
>> https://lists.berlios.de/mailman/listinfo/bitbake-dev
>>
>


