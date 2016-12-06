Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 75E30719BA
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 00:26:56 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id 12so33759258uas.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2016 16:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=mVMmFyvWvcCU7ikcQqwWuOLCeXOz/SH9x/Y9ofkxnCc=;
	b=hJZqJ6FDrN0qhXlxtibzBupYfmLpZoePIKmRLvrlel86WRENlrRhbsNb0MlGsg2tzp
	aLtf9jTjBUmNs0oCmvv+exRixd9UqE0MbZ4I8bdoAXC3Kl3oU5rbbGK0kp6zdN3VvdxC
	fUiPBJ69t+wIDMAHVc8mNn7mqaQ+vHHJx7NmxrAs/YQtPkojm3DOXl76wxb2t8UE5eov
	tOQMc9med0909pE/qow3rq0wa/jVXYOJsO6BywIwJomVZikaWa9EUYBnnqaLUziGJ4Rm
	PAvz5ATncdiA0CrdIWeHT9UQe22Sq9crPQ879ALz1773Fexn3cWfetD1Z74seL3lzpFZ
	dX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=mVMmFyvWvcCU7ikcQqwWuOLCeXOz/SH9x/Y9ofkxnCc=;
	b=hCH9549RZB2es/DzTpcO0OEL/NdGjQ+ksbDb7rhmLltV/N9XLY72dI379/+jm1jwVe
	GoW7iqdh7l5lDBiPQ8TGns/Txada3vHSxVCYR6ZUcS5FqVITwBpUK++t+d8fwli9iz/K
	x/ZrCKHyJ4b/qEkuKXALFMSfDYfgebSSl8ArmvYWP5E9jXxGbijqjUKLJlG4s5HJPyaO
	HuQzmhtwK9gtZsnJNpeWfK00Cswb2BqwFeG56tO1IYG8t+yz9Zg3VqKFu8sUtb6VdYt8
	Ri2z+Ux9rC+O01ZXPtg6r3h3B+FBWiIucwL9tlcGyPJ6S9h+sTOW+ZF++nMyJIX+fYJ3
	ueow==
X-Gm-Message-State: AKaTC00gb+0ekVDz+rl/bvs6o8nLbFctSawQYjPpQT/PiCAIwaBS/A98wUe3ys4Uc2UAZHKbDNf9euWo+7L7nA==
X-Received: by 10.176.82.181 with SMTP id v50mr39087796uav.31.1480984017452;
	Mon, 05 Dec 2016 16:26:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 5 Dec 2016 16:26:56 -0800 (PST)
Received: by 10.159.48.87 with HTTP; Mon, 5 Dec 2016 16:26:56 -0800 (PST)
In-Reply-To: <CALbNGRQLu7rhbQP9S0MDBVLdbCPbCybu_nqu++yZpD2fSbn6=g@mail.gmail.com>
References: <1480979306-21331-1-git-send-email-schnitzeltony@googlemail.com>
	<689CB891-7D18-4FEB-9BE5-DF2CD80B066E@gmail.com>
	<CALbNGRQLu7rhbQP9S0MDBVLdbCPbCybu_nqu++yZpD2fSbn6=g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 5 Dec 2016 16:26:56 -0800
Message-ID: <CAMKF1sqjjTooJzi_8hknVNj_OaYAFcOcsL8QZVSw-zOSuwdoFg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-xfce][PATCH 1/2] exo: fix build after perl update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Dec 2016 00:26:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Ok

On Dec 5, 2016 3:59 PM, "Andreas M=C3=BCller" <schnitzeltony@googlemail.com=
>
wrote:

> On Tue, Dec 6, 2016 at 12:32 AM, Khem Raj <raj.khem@gmail.com> wrote:
> >
> >> On Dec 5, 2016, at 3:08 PM, Andreas M=C3=BCller <
> schnitzeltony@googlemail.com> wrote:
> >>
> >> fixes:
> >>
> >> | checking for perl5... no
> >> | checking for perl... perl
> >> | checking for perl module URI::Escape... no
> >> | checking for perl module URI::file... no
> >> | checking for perl module URI::URL... no
> >> | configure: error: Atleast one of the required Perl modules
> (URI::Escape, URI::file and URI::URL) was not found on your system
> >>
> >
> > I was seeing same errors. Should this be using native perl instead ?
> For exo case I think we already do: The only 'perlish' is
> liburi-perl-native in DEPENDS and perlnative in inherit
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

