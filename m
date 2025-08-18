Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E129ECA0ED1
	for <webhook@archiver.kernel.org>; Mon, 18 Aug 2025 15:54:18 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.79057.1755532451550387482
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Aug 2025 08:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=e7cDUPBH;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e931cad1fd8so4414222276.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 18 Aug 2025 08:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755532451; x=1756137251; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEM6BGD5f6MNIOTv/VdDOYpF6CqDkIGb7d8OogsESVI=;
        b=e7cDUPBH+JZMAyaszkO+DA2+7MeJyqjWrUMRL2gM2V3EbiyhwS9501Wx9C+SmSjbGW
         rB401WYp2S4KKpuIhZUVLA+fS+urjxyKscTN+KEjfHl20elbtBOlOSjN4Dl3VvJ0i2wU
         B44oTrYcKUMW9uI3+/1ejjJVj0RxPhAUeDous4tgPNxNRDT/1/KqC9243wxqO33FQW4k
         yVCAHqKVmq1aY5UHVOxhmCadkC2n/U4JWQ4RXhRyvf8ijB9nl133hN+iCaaeAssZdsMH
         d/qzUznz2KmBF5PH3xmGySqIyalT6Lf6+ruhdJZf8Hb41NHSGr1Fte8G2Fb1qFDV7Tp+
         7S4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755532451; x=1756137251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEM6BGD5f6MNIOTv/VdDOYpF6CqDkIGb7d8OogsESVI=;
        b=hEivOT+lAyZQ8sn2CAu7tu9jifFFmmlE3ITHxuD8BXidAiCQGxLsASn/zaEWysp6Yn
         QFLIgAVwfqDqY5NsONLhJQmDo9sRtfqQlgi6pR047plf6La49384f14DjvGngypNV2Pc
         KjOpRdKoqbacTU6X50yWSQvlgUg90Tw9cqeDTX1kDWswCOgCRjtWvz7IHUWxSiumdJHF
         P/0VBNAupdUSEeZApLNnoF+QeYtc+fv+wB7UInCJwX7xDzwi8QSQCAmSkpMeS3XeEG/i
         YthtpYruqKUGqd0ivDrSKAZ5sLObyN3c5ubwe225ayqOU97ovVBVuAB1vf3st+F7anJ4
         2Chw==
X-Forwarded-Encrypted: i=1; AJvYcCU46D1DC5HMy/niJMoeO45wce5Rr095rbpHrj6nS4cefWj53ZsSWDWVXXnL1TeWXN1teyKaahXfoRlf6o/hSgsdbs0=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzRuoudo029u9pYMdoegSc1aHg+LOWDJ11I690BU/8ADsn/xrNI
	avmqeWxW1boG8ivMXv5LO/TN4YSfjr3pi6p5MmbKQk5eTbhbUgCjDFegNBGPuXS91rSfOSzMKmG
	LbpyKCxnlj+3Xwma6Op5g2EGq0s4y/7Y=
X-Gm-Gg: ASbGncsfTgpEsFK4OiUBZRI69NRjVsdMjTSHhglcJnwVtY0KewrbM/X66f9Yk10mrS+
	/eMW8F1ksDXjByQ3/y0fOltcEJWYjIC4ZHFWW5HAOR/cJzOorToGC54xT/SNSNeC7pD2FuKY3UV
	sLNBfn8bGQnrwYcn022TRi49kFHxWKRCsh3bk8q7M+vAE/tTmC0CBx/QoHXd7VEHTzZWt1JCYgl
	MpABdxkm7RJU8EQBzmsBA5k7i9xVmF5RmSA+Esp
X-Google-Smtp-Source: AGHT+IG14fzfv0SRe+A5emOrZUVamKBGf2M75/BfCrH8e5bqN91VdhONhjNdP90Y0D3iB3QbFf8ZUylG8DkPGDpQFlI=
X-Received: by 2002:a05:6902:150c:b0:e8e:2535:5cb with SMTP id
 3f1490d57ef6-e93324d796dmr13606207276.35.1755532450539; Mon, 18 Aug 2025
 08:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250818051822.2020242-1-skandigraun@gmail.com> <NbrzaHpfAWPqi-rTp69zmTWSP1WKB335lMHfPXy0Q-L8N9N_Gim_nxk5cjhA4TuNTnwAwurAg894434Gzp1tksD-X8ZavBD7ENbwzewjXP4=@proton.me>
In-Reply-To: <NbrzaHpfAWPqi-rTp69zmTWSP1WKB335lMHfPXy0Q-L8N9N_Gim_nxk5cjhA4TuNTnwAwurAg894434Gzp1tksD-X8ZavBD7ENbwzewjXP4=@proton.me>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 18 Aug 2025 08:53:44 -0700
X-Gm-Features: Ac12FXxok4vGSectahwfVsnX0_mHICy7wfTbQlnC3D742cPqHYleMNsmgLG9Fd4
Message-ID: <CAMKF1sp508ax56O92q5g=doZP=1XVh5_d-5jWL+4KTF3f72sTw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] gitpkgv.bbclass: inspect repository in UNPACKDIR
To: WXbet@proton.me
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Aug 2025 15:54:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118995

On Mon, Aug 18, 2025 at 8:00=E2=80=AFAM WXbet via lists.openembedded.org
<WXbet=3Dproton.me@lists.openembedded.org> wrote:
>
> Idea for shallow clones: Why you don=E2=80=99t convert the last commit=E2=
=80=98s date/time to a UNIX timestamp number ( e.g. git show -s --format=3D=
%ct HEAD ) and use this instead of the commit count number?

sometimes commit times are not applied chronologically, perhaps
because it preserves the creation time.
>
> Regards WXbet
>
>
> Am Montag, 18. August 2025 um 07:18, Gyorgy Sarvari <skandigraun@gmail.co=
m> schrieb:
>
> When BB_GIT_SHALLOW =3D "1" is used, the unpacked gir repository doesn't
> exist in the download folder, and the class isn't able to inspect the
> details of the repository.
>
> Instead inspect the repository it the UNPACKDIR.
>
> Beside this, since BitBake fetcher performs an actual initial shallow
> clone of the repository when this feature is enabled, it is not possible
> to determine the exact number of commits. Add a warning about this.
>
> Reported-by: WXbet <WXbet@proton.me>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
> meta-oe/classes/gitpkgv.bbclass | 25 ++++++++++++++++++++-----
> 1 file changed, 20 insertions(+), 5 deletions(-)
>
> diff --git a/meta-oe/classes/gitpkgv.bbclass b/meta-oe/classes/gitpkgv.bb=
class
> index eb4b1eae9a..c3d98cb2e1 100644
> --- a/meta-oe/classes/gitpkgv.bbclass
> +++ b/meta-oe/classes/gitpkgv.bbclass
> @@ -21,6 +21,11 @@
> # v1.2, xtest, v2.0" will force you to increment PE to get upgradeable
> # path to v2.0 revisions
> #
> +# Another WARNING: Since Walnascar release BB_SHALLOW_GIT will actually
> +# perform a shallow initial checkout, which makes it impossible to deter=
mine
> +# the correct number of commits in the repository - thus using this clas=
s
> +# is not recommended when shallow cloning is enabled.
> +#
> # use example:
> #
> # inherit gitpkgv
> @@ -59,6 +64,9 @@ def get_git_pkgv(d, use_tags):
> from shlex import quote
>
> src_uri =3D d.getVar('SRC_URI').split()
> + unpackdir =3D d.getVar('UNPACKDIR')
> + def_destsuffix =3D (d.getVar("BB_GIT_DEFAULT_DESTSUFFIX") or "git") + "=
/"
> +
> fetcher =3D bb.fetch2.Fetch(src_uri, d)
> ud =3D fetcher.ud
>
> @@ -78,20 +86,27 @@ def get_git_pkgv(d, use_tags):
> found =3D False
> for url in ud.values():
> if url.type =3D=3D 'git' or url.type =3D=3D 'gitsm':
> - if not os.path.exists(url.localpath):
> + destsuffix =3D url.parm.get("destsuffix", def_destsuffix)
> + subdir =3D url.parm.get('subdir', '')
> + destdir =3D os.path.join(unpackdir, destsuffix, subdir)
> +
> + if not os.path.exists(destdir):
> return None
>
> + if d.getVar('BB_GIT_SHALLOW') =3D=3D '1':
> + bb.warnonce('%s: Shallow cloning enabled - gitpkgv.bbclass will not gen=
erate sortable versions' % d.getVar('PN'))
> +
> found =3D True
>
> - vars =3D { 'repodir' : quote(url.localpath),
> + vars =3D { 'repodir' : quote(destdir),
> 'rev' : quote(url.revision) }
>
> rev =3D bb.fetch2.get_srcrev(d).split('+')[1]
> - rev_file =3D os.path.join(url.localpath, "oe-gitpkgv_" + url.revision)
> + rev_file =3D os.path.join(destdir, "oe-gitpkgv_" + url.revision)
>
> if not os.path.exists(rev_file) or os.path.getsize(rev_file)=3D=3D0:
> commits =3D bb.fetch2.runfetchcmd(
> - "git --git-dir=3D%(repodir)s rev-list %(rev)s -- 2>/dev/null | wc -l"
> + "git -C %(repodir)s rev-list %(rev)s -- 2>/dev/null | wc -l"
> % vars, d, quiet=3DTrue).strip().lstrip('0')
>
> if commits !=3D "":
> @@ -107,7 +122,7 @@ def get_git_pkgv(d, use_tags):
> if use_tags:
> try:
> output =3D bb.fetch2.runfetchcmd(
> - "git --git-dir=3D%(repodir)s describe %(rev)s --tags --exact-match 2>/d=
ev/null"
> + "git -C %(repodir)s describe %(rev)s --tags --exact-match 2>/dev/null"
> % vars, d, quiet=3DTrue).strip()
> ver =3D gitpkgv_drop_tag_prefix(d, output)
> except Exception:
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#118994): https://lists.openembedded.org/g/openembedde=
d-devel/message/118994
> Mute This Topic: https://lists.openembedded.org/mt/114758958/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

