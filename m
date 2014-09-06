Return-Path: <switesh.fulpagare@mindastoneridge.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id AACB7713E0
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  6 Sep 2014 03:55:19 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id la4so13434571vcb.29
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Sep 2014 20:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=SjQ8vTo8lVw13Uo9Gmyyra4DTSKS0p95D7jQRT7wgZM=;
	b=Dn74kGcdqLq87SxOR28U2TwFK4YEsRXKPTNiP/wfF1/xCDGNDzjpJLZZqVMDeKQGB4
	evFK5YpkaDUekLhh6gzZKA0LEASOxbPIzLJoqBA2dNuyIu3W7AUA8+MVpV2DhGlb2rKx
	j6MklBlhk6397Ct0sh8W3DCa3hnX1JjNzfqZs2GVrPV4bLYK4noP6fePpwk5DDO9ATWS
	9E0txn5fwCuziHmZ0h4eeYcDNaEsnkauTLNFjJq49hf6wo/EKiW2u/ML2EpM01Cz9BSl
	nB/5/RDs/pguqP6ZY/81m9E0U4LcPGMjPjPd8MQI6xGcnUzYW+CEJ0+PkK1DNS2B6wbZ
	pzuw==
X-Gm-Message-State: ALoCoQkpqjw/OAvtdUPp+5eP1uNjmfnyM3zCt856iPS6wySTdy4+S5/utU7yZFgtu2MvUa/IXkzcEq2wg1hTudjJGUcVFegWNsj1GaTpRDBeIrkiRj4YS80694ga9BRfbyZRmKpyJXfYfTd1nRv/umNmB86zdzoLwg==
MIME-Version: 1.0
X-Received: by 10.220.175.17 with SMTP id v17mr13957458vcz.0.1409975720909;
	Fri, 05 Sep 2014 20:55:20 -0700 (PDT)
Received: by 10.52.245.73 with HTTP; Fri, 5 Sep 2014 20:55:20 -0700 (PDT)
In-Reply-To: <CAP9ODKp=xaS+WoQe-zKTpcKiqmdk4mHteoZ8a9BqO1w96hcbxg@mail.gmail.com>
References: <CALRGHr-x0HHMz8paVPVFxmoZ41zRGBZ4GmY3N35VKfYx57v6Lg@mail.gmail.com>
	<CAP9ODKqZyLwdSGVSResWqOsxTLfPMXhGbh9a1mZL16RTG8nPsQ@mail.gmail.com>
	<CALRGHr9ts28vt-JN2v4SPKjd7-btmWrqVd7G=_cfcv4bGD_z1g@mail.gmail.com>
	<CALRGHr_u5LULhoxx0NLYK6Uux4uZ5Kr7+ikOY-TKqMvDfUfYmg@mail.gmail.com>
	<CAP9ODKp=xaS+WoQe-zKTpcKiqmdk4mHteoZ8a9BqO1w96hcbxg@mail.gmail.com>
Date: Sat, 6 Sep 2014 09:25:20 +0530
Message-ID: <CALRGHr_OiFeW60BsKxe0XdrBbkcXAE+usv3-=pHnhXCzONK_vg@mail.gmail.com>
From: Switesh Fulpagare <switesh.fulpagare@mindastoneridge.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Error while bitbake meta-toolchain-qt5
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Sep 2014 03:55:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Otavio,
     Thanks for your mail.
Yes, Otavio you are right.
There is  / at the end of DL_DIR in the local.conf file.
I had removed that and once again given bitbake meta-toolchain-qt5
but as result as earlier. See the link below.

http://pastebin.com/a8VjfKXh




On Fri, Sep 5, 2014 at 5:29 PM, Otavio Salvador <otavio@ossystems.com.br>
wrote:

> On Fri, Sep 5, 2014 at 8:08 AM, Switesh Fulpagare
> <switesh.fulpagare@mindastoneridge.com> wrote:
> > Hi Otavio,
> >    Thanks for your reply.
> > I have applied the patch, now it is fetching qtwayland_git.bb but it is
> > giving error for do unpack as shown in below link and
> > qtwayland-native_git.bb is not going to fetch.
> >
> >
> > http://pastebin.com/dk2gFin0
>
> My bet is that your local.conf, DL_DIR, is pointing to a path with /
> at end, fix it.
>
> --
> Otavio Salvador                             O.S. Systems
> http://www.ossystems.com.br        http://code.ossystems.com.br
> Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

--=20
=E2=80=9CThe contents of this e-mail message and any attachments are confid=
ential=20
and are intended solely for addressee. The information may also be legally=
=20
privileged. This transmission is sent in trust, for the sole purpose of=20
delivery to the intended recipient. If you have received this transmission=
=20
in error, any use, reproduction or dissemination of this transmission is=20
strictly prohibited. If you are not the intended recipient, please=20
immediately notify the sender by reply e-mail or phone and delete this=20
message and its attachments, if any.=E2=80=9D

