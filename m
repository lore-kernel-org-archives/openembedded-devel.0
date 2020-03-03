Return-Path: <andre.draszik@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id ADD36618EE
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 18:23:22 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id r17so5662521wrj.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 10:23:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=VpO2lQRMdgTcfEYbQwmkfMUSBxCyF+bVirP+qOn/hkc=;
	b=WctQC3JOT58Vc6+jxtQ8PFqiBHuiKXuOgUHZDeGfr9SDshY4y/6D1ju/FfsZdsSER+
	RWg1CFXHnKTZbo+1xb5mF11coh/U5OiZqbbKAkCierlV9I3veKg2BJhbDZKF+DGUWtmR
	XbIf5yAcyP6+yR+VqT4+7fw9ndW3+u3uRi36H68fPXhM+zhTIEbJz5t9oVLKYojSkOCZ
	AFi8yr+XYdEJtQ/W8BAiUVdJL8aejVndAU+0jRwNA3nAMYQl3TIMP8O1DDkzZWGKgu50
	mnRVlB3F4j40oXuL9PfxijhEju1ZVCiq2I/8AEdlJyN3IsaEIberys20wwygEk/pGrxz
	nZjg==
X-Gm-Message-State: ANhLgQ3R9lPdILAqeCCL74bR0QUC+bs8j+SKrxDPu3n7fIL05evyxRvn
	nuLtQE4oCvMb2edZE72/qIM=
X-Google-Smtp-Source: ADFU+vvJWblG+LmQoD5cW0+dnM4FJ+UL/Muk+VRhEczbAWPwk58ucGYAGx0Yfp7ILxUiOyhaJ1Skvw==
X-Received: by 2002:a05:6000:108:: with SMTP id
	o8mr6558593wrx.312.1583259803274; 
	Tue, 03 Mar 2020 10:23:23 -0800 (PST)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	u25sm4968502wml.17.2020.03.03.10.23.22
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 03 Mar 2020 10:23:22 -0800 (PST)
Message-ID: <df06534ba04e39f5a4948283407ca00024458113.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Date: Tue, 03 Mar 2020 18:23:22 +0000
In-Reply-To: <6daa6cf0-6cce-8a7f-fae2-4c36e3c7bad3@gmail.com>
References: <20200303172851.19000-1-git@andred.net>
	<6daa6cf0-6cce-8a7f-fae2-4c36e3c7bad3@gmail.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Subject: Re: [meta-oe][master-next][PATCH v2 1/2] nodejs: drop 'gyp' PACKAGECONFIG
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
X-List-Received-Date: Tue, 03 Mar 2020 18:23:22 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2020-03-03 at 10:00 -0800, Khem Raj wrote:
> 
> On 3/3/20 9:28 AM, André Draszik wrote:
> > From: André Draszik <andre.draszik@jci.com>
> > 
> > During the python3 / nodejs update, the dependencies weren't updated, so
> > using system-gyp ends up trying to use the python2 version of system-
> > gyp, which will of course fail.
> > Fixing this to depend on the python3 version of gyp still doesn't
> > doesn't make things work, though:
> >      ERROR: nodejs-native-12.14.1-r0 do_configure: Execution of '.../nodejs-native/12.14.1-
> > r0/temp/run.do_configure.26054' failed with exit code 1:
> >      gyp: Error importing pymod_do_mainmodule (ForEachFormat): No module named 'ForEachFormat' while loading
> > dependencies of .../nodejs-native/12.14.1-r0/node-v12.14.1/node.gyp while trying to load .../nodejs-native/12.14.1-
> > r0/node-v12.14.1/node.gyp
> >      Error running GYP
> > 
> > The reason is the following patch nodejs has applied to its version of gyp as
> > of NodeJS v12 (commit fff922afee6e ("deps,build: compute torque_outputs in v8.gyp")
> > upstream):
> > 
> > --- gyp/pylib/gyp/input.py      2020-03-02 12:36:30.788248197 +0000
> > +++ node.git/tools/gyp/pylib/gyp/input.py    2020-03-02 12:16:09.956707788 +0000
> > @@ -890,6 +881,7 @@ def ExpandVariables(input, phase, variab
> >             oldwd = os.getcwd()  # Python doesn't like os.open('.'): no fchdir.
> >             if build_file_dir:  # build_file_dir may be None (see above).
> >               os.chdir(build_file_dir)
> > +          sys.path.append(os.getcwd())
> >             try:
> > 
> >               parsed_contents = shlex.split(contents)
> > @@ -900,6 +892,7 @@ def ExpandVariables(input, phase, variab
> >                                "module (%s): %s" % (parsed_contents[0], e))
> >               replacement = str(py_module.DoMain(parsed_contents[1:])).rstrip()
> >             finally:
> > +            sys.path.pop()
> >               os.chdir(oldwd)
> >             assert replacement != None
> >           elif command_string:
> 
> Please avoid adding diffs to commit message, this confuses git am
> perhaps better to express the change with few words.

Sorry Khem, I didn't think of that... Done.

A.

> 
> > Since I'm not sure how to deal with that when using system-gyp, and because
> > the original intention for using system-gyp was to make the previous nodejs
> > version compatible with python3 by ultimately switching to the python3 version
> > of system-gyp which isn't necessary anymore, and given nobody else seems to
> > be using this PACKAGECONFIG, just drop it.
> > 
> > Signed-off-by: André Draszik <andre.draszik@jci.com>
> > ---
> >   meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb | 3 ---
> >   1 file changed, 3 deletions(-)
> > 
> > diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> > index 6eb52c209..49bb71e28 100644
> > --- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> > +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> > @@ -53,7 +53,6 @@ ARCHFLAGS ?= ""
> >   
> >   PACKAGECONFIG ??= "ares icu libuv zlib"
> >   PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
> > -PACKAGECONFIG[gyp] = ",,gyp-py2-native"
> >   PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
> >   PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
> >   PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
> > @@ -82,8 +81,6 @@ python do_unpack() {
> >       shutil.rmtree(d.getVar('S') + '/deps/openssl', True)
> >       if 'ares' in d.getVar('PACKAGECONFIG'):
> >           shutil.rmtree(d.getVar('S') + '/deps/cares', True)
> > -    if 'gyp' in d.getVar('PACKAGECONFIG'):
> > -        shutil.rmtree(d.getVar('S') + '/tools/gyp', True)
> >       if 'libuv' in d.getVar('PACKAGECONFIG'):
> >           shutil.rmtree(d.getVar('S') + '/deps/uv', True)
> >       if 'nghttp2' in d.getVar('PACKAGECONFIG'):
> > 


