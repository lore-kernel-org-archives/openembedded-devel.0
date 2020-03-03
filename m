Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0E81261904
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 17:25:14 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id v22so3401213qtp.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 09:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=bG2Bcl9f1SAMiIZ+4wPt08sbWwh0IQOs/ifeDTvRS7k=;
	b=KpX9qYIgIAauimF3wb5J8vVjHF77o7vXIcDimj98RECNgExz5xzDpZ8qAYEHt3NykP
	DJkT+iWzSs+h03HZWeVj3gCVg6wn0fL87K11GnxYF7K9lkIN4FnIIc/w6XZp4uvtewBD
	XAfKraALmpfH34WvsWnQbFBGUNoQ1dSwL1nuvCYDv8RmfEtMIOkGe95PL0ZUM1pw7GzO
	vg7UAUAu+mfQdq2t5gmt37P+lXQt84Ssdk9S5Fl2mt98nxErYen+4ch7tyGoSk5Taqq0
	avP+OI2N8rQS8CiicGkLS9Y/pS1ROOC7YK4OyWKphHMfxRfhXV56oib1peDAdGTemAmt
	8yXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=bG2Bcl9f1SAMiIZ+4wPt08sbWwh0IQOs/ifeDTvRS7k=;
	b=azPd0PXvVA3kc2PsARFFRvXSzBDHLawwujNNMkeIwPF/Kc9/DlVS4YFt/MH9cE9S8c
	9mYfzThz1JwLN+0qLDwPRfzdtARJfKpfo6ERa60JyLMSeMVxPTGy1gk3UOo/SEu/SaTN
	fg1mAJA8E3sGqcLti7TELmA+MWqrucQqx/x7iabbHGdM13BZb4cz34bTgfjrVY/vaugG
	gxxooYK5gvRzHdN+VdUYU3dIvwuirNbtyRfymBmycDd/viR9k3YWYQOzSjT5dAtyQPoU
	s5on7YCSpSPgFF7VmM5H2eF5uBGbVBu/ftV6eArPW2ehchaRLnPQzu+V7aRaFzFbfgJd
	eJSQ==
X-Gm-Message-State: ANhLgQ2rvVwsXqp4TQyWf2YdHidqL0YG95T0YOaS/fXqBcnPxQWvP9vJ
	493nWddsyOaUVmrMbEXz++apu1dvOZjird6X7pQ=
X-Google-Smtp-Source: ADFU+vuHSQf44tPdmP2cufxQ1/9rgLc0qfThUnLmceDMgh/Rsd7SwMcljA4XinR0H2g+utkBH1E6PZLGpoPPdIZQoO0=
X-Received: by 2002:ac8:5351:: with SMTP id d17mr5492549qto.190.1583256315334; 
	Tue, 03 Mar 2020 09:25:15 -0800 (PST)
MIME-Version: 1.0
References: <20200303134534.36509-1-git@andred.net>
In-Reply-To: <20200303134534.36509-1-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 3 Mar 2020 09:24:47 -0800
Message-ID: <CAMKF1so8ZV_HZNma1Ddwn6a6irZ_Lurd5-JEqiDaCajpjdN9oA@mail.gmail.com>
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <git@andred.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/3] nodejs: drop 'gyp' PACKAGECONFIG
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
X-List-Received-Date: Tue, 03 Mar 2020 17:25:15 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

can you rebase it on top of master-next and resend

On Tue, Mar 3, 2020 at 5:45 AM Andr=C3=A9 Draszik <git@andred.net> wrote:
>
> From: Andr=C3=A9 Draszik <andre.draszik@jci.com>
>
> During the python3 / nodejs update, the dependencies weren't updated, so
> using system-gyp ends up trying to use the python2 version of system-
> gyp, which will of course fail.
> Fixing this to depend on the python3 version of gyp still doesn't
> doesn't make things work, though:
>     ERROR: nodejs-native-12.14.1-r0 do_configure: Execution of '.../nodej=
s-native/12.14.1-r0/temp/run.do_configure.26054' failed with exit code 1:
>     gyp: Error importing pymod_do_mainmodule (ForEachFormat): No module n=
amed 'ForEachFormat' while loading dependencies of .../nodejs-native/12.14.=
1-r0/node-v12.14.1/node.gyp while trying to load .../nodejs-native/12.14.1-=
r0/node-v12.14.1/node.gyp
>     Error running GYP
>
> The reason is the following patch nodejs has applied to its version of gy=
p as
> of NodeJS v12 (commit fff922afee6e ("deps,build: compute torque_outputs i=
n v8.gyp")
> upstream):
>
> --- gyp/pylib/gyp/input.py      2020-03-02 12:36:30.788248197 +0000
> +++ node.git/tools/gyp/pylib/gyp/input.py    2020-03-02 12:16:09.95670778=
8 +0000
> @@ -890,6 +881,7 @@ def ExpandVariables(input, phase, variab
>            oldwd =3D os.getcwd()  # Python doesn't like os.open('.'): no =
fchdir.
>            if build_file_dir:  # build_file_dir may be None (see above).
>              os.chdir(build_file_dir)
> +          sys.path.append(os.getcwd())
>            try:
>
>              parsed_contents =3D shlex.split(contents)
> @@ -900,6 +892,7 @@ def ExpandVariables(input, phase, variab
>                               "module (%s): %s" % (parsed_contents[0], e)=
)
>              replacement =3D str(py_module.DoMain(parsed_contents[1:])).r=
strip()
>            finally:
> +            sys.path.pop()
>              os.chdir(oldwd)
>            assert replacement !=3D None
>          elif command_string:
>
> Since I'm not sure how to deal with that when using system-gyp, and becau=
se
> the original intention for using system-gyp was to make the previous node=
js
> version compatible with python3 by ultimately switching to the python3 ve=
rsion
> of system-gyp which isn't necessary anymore, and given nobody else seems =
to
> be using this PACKAGECONFIG, just drop it.
>
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@jci.com>
> ---
>  meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/=
recipes-devtools/nodejs/nodejs_12.14.1.bb
> index 6eb52c209..49bb71e28 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> @@ -53,7 +53,6 @@ ARCHFLAGS ?=3D ""
>
>  PACKAGECONFIG ??=3D "ares icu libuv zlib"
>  PACKAGECONFIG[ares] =3D "--shared-cares,,c-ares"
> -PACKAGECONFIG[gyp] =3D ",,gyp-py2-native"
>  PACKAGECONFIG[icu] =3D "--with-intl=3Dsystem-icu,--without-intl,icu"
>  PACKAGECONFIG[libuv] =3D "--shared-libuv,,libuv"
>  PACKAGECONFIG[nghttp2] =3D "--shared-nghttp2,,nghttp2"
> @@ -82,8 +81,6 @@ python do_unpack() {
>      shutil.rmtree(d.getVar('S') + '/deps/openssl', True)
>      if 'ares' in d.getVar('PACKAGECONFIG'):
>          shutil.rmtree(d.getVar('S') + '/deps/cares', True)
> -    if 'gyp' in d.getVar('PACKAGECONFIG'):
> -        shutil.rmtree(d.getVar('S') + '/tools/gyp', True)
>      if 'libuv' in d.getVar('PACKAGECONFIG'):
>          shutil.rmtree(d.getVar('S') + '/deps/uv', True)
>      if 'nghttp2' in d.getVar('PACKAGECONFIG'):
> --
> 2.23.0.rc1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

