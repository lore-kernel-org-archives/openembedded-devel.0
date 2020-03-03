Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9CCBC618E3
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Mar 2020 18:00:40 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id n7so1859611pfn.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Mar 2020 10:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-language:content-transfer-encoding;
	bh=T0GntpemgtI7FmL6AFLgt5nNP5U5LZeqRBMkuD94AsE=;
	b=D3IVv7Drb989Jvgh+uBRTePm3zqLmMPZQnjFTHwhqI1QbG4An5yEtwOnNeHIW/dFL5
	fkwMXU1irqbjNwk1D6BXpIatpgV4LmLWULwvJghC4vKcHe+0S/d5bIUWkubWEE1gI8hZ
	gDU9TI5PZR9NgqW8AkISEA7OY8/V/cEPQtE47PgnZuPbBY7fjDwcq+u6x95j2tn4IWH9
	UgNZscKSSLp7owRXha3M9OlkmTe1l8d8kORdcH1FJ9kuKbrdTWWbSMelsSbCFG0cLs0i
	A4D0TOP42YXlsVBpEJN9G/MxhKjD9C0Ef57j2YzZFTE9qqgjwzpPBKoqlvOO99borm5H
	uZ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=T0GntpemgtI7FmL6AFLgt5nNP5U5LZeqRBMkuD94AsE=;
	b=SwjfYmpNLg8LBrqNvNFUK1nil1wWyNlWydwGPCLVc25VAn2TRvmP/XKlD9xnZgrJY5
	/oRp0Hjj4IiGN47/NVZphBM06vKt8au8JxJlRB05sByOgSHHlcM9TL14AxgAzchHW9zw
	mNvWSG4HCkmprmnUFn3vDVYC4LSRwV+3GbN0qcS7vwC6vRTSMr+rsXj9cA7rq+5xgJRV
	/oP09Yeh++7S5E1dy5TbysDW1OsudyP5xHtyK2X2MG1Yb7CybknETUYbppUd6amtgUOr
	KQh+jB5R3ofr8fgy7Ion1VFc8Zk/5gqo1hRK4T+sX1uz1PqkJ5EKjrpdD+0mvcWOJ4cw
	E0OA==
X-Gm-Message-State: ANhLgQ3FVFrVIe9bmdRwjoclhod+Ejbh/UdlhqBRAeR2hNU+ci/SKzpd
	OOxikZAqjD7hu0hOvPctw5OINVqAUYw=
X-Google-Smtp-Source: ADFU+vs+0X+RqQjPXqHSDOvIsvE1CDqNXPPnb9/To73bJh/foXk+bbtEIgjOirbhY2Gj6KfzUMixLg==
X-Received: by 2002:a63:715b:: with SMTP id b27mr5201465pgn.275.1583258440465; 
	Tue, 03 Mar 2020 10:00:40 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:31ff:997f:e0c7:a3a0?
	([2601:646:9200:4e0:31ff:997f:e0c7:a3a0])
	by smtp.gmail.com with ESMTPSA id k5sm9917938pfp.66.2020.03.03.10.00.39
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 03 Mar 2020 10:00:39 -0800 (PST)
To: =?UTF-8?Q?Andr=c3=a9_Draszik?= <git@andred.net>,
	openembedded-devel@lists.openembedded.org
References: <20200303172851.19000-1-git@andred.net>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <6daa6cf0-6cce-8a7f-fae2-4c36e3c7bad3@gmail.com>
Date: Tue, 3 Mar 2020 10:00:38 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200303172851.19000-1-git@andred.net>
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
X-List-Received-Date: Tue, 03 Mar 2020 18:00:40 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 3/3/20 9:28 AM, André Draszik wrote:
> From: André Draszik <andre.draszik@jci.com>
> 
> During the python3 / nodejs update, the dependencies weren't updated, so
> using system-gyp ends up trying to use the python2 version of system-
> gyp, which will of course fail.
> Fixing this to depend on the python3 version of gyp still doesn't
> doesn't make things work, though:
>      ERROR: nodejs-native-12.14.1-r0 do_configure: Execution of '.../nodejs-native/12.14.1-r0/temp/run.do_configure.26054' failed with exit code 1:
>      gyp: Error importing pymod_do_mainmodule (ForEachFormat): No module named 'ForEachFormat' while loading dependencies of .../nodejs-native/12.14.1-r0/node-v12.14.1/node.gyp while trying to load .../nodejs-native/12.14.1-r0/node-v12.14.1/node.gyp
>      Error running GYP
> 
> The reason is the following patch nodejs has applied to its version of gyp as
> of NodeJS v12 (commit fff922afee6e ("deps,build: compute torque_outputs in v8.gyp")
> upstream):
> 
> --- gyp/pylib/gyp/input.py      2020-03-02 12:36:30.788248197 +0000
> +++ node.git/tools/gyp/pylib/gyp/input.py    2020-03-02 12:16:09.956707788 +0000
> @@ -890,6 +881,7 @@ def ExpandVariables(input, phase, variab
>             oldwd = os.getcwd()  # Python doesn't like os.open('.'): no fchdir.
>             if build_file_dir:  # build_file_dir may be None (see above).
>               os.chdir(build_file_dir)
> +          sys.path.append(os.getcwd())
>             try:
> 
>               parsed_contents = shlex.split(contents)
> @@ -900,6 +892,7 @@ def ExpandVariables(input, phase, variab
>                                "module (%s): %s" % (parsed_contents[0], e))
>               replacement = str(py_module.DoMain(parsed_contents[1:])).rstrip()
>             finally:
> +            sys.path.pop()
>               os.chdir(oldwd)
>             assert replacement != None
>           elif command_string:


Please avoid adding diffs to commit message, this confuses git am
perhaps better to express the change with few words.

> 
> Since I'm not sure how to deal with that when using system-gyp, and because
> the original intention for using system-gyp was to make the previous nodejs
> version compatible with python3 by ultimately switching to the python3 version
> of system-gyp which isn't necessary anymore, and given nobody else seems to
> be using this PACKAGECONFIG, just drop it.
> 
> Signed-off-by: André Draszik <andre.draszik@jci.com>
> ---
>   meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> index 6eb52c209..49bb71e28 100644
> --- a/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> +++ b/meta-oe/recipes-devtools/nodejs/nodejs_12.14.1.bb
> @@ -53,7 +53,6 @@ ARCHFLAGS ?= ""
>   
>   PACKAGECONFIG ??= "ares icu libuv zlib"
>   PACKAGECONFIG[ares] = "--shared-cares,,c-ares"
> -PACKAGECONFIG[gyp] = ",,gyp-py2-native"
>   PACKAGECONFIG[icu] = "--with-intl=system-icu,--without-intl,icu"
>   PACKAGECONFIG[libuv] = "--shared-libuv,,libuv"
>   PACKAGECONFIG[nghttp2] = "--shared-nghttp2,,nghttp2"
> @@ -82,8 +81,6 @@ python do_unpack() {
>       shutil.rmtree(d.getVar('S') + '/deps/openssl', True)
>       if 'ares' in d.getVar('PACKAGECONFIG'):
>           shutil.rmtree(d.getVar('S') + '/deps/cares', True)
> -    if 'gyp' in d.getVar('PACKAGECONFIG'):
> -        shutil.rmtree(d.getVar('S') + '/tools/gyp', True)
>       if 'libuv' in d.getVar('PACKAGECONFIG'):
>           shutil.rmtree(d.getVar('S') + '/deps/uv', True)
>       if 'nghttp2' in d.getVar('PACKAGECONFIG'):
> 

