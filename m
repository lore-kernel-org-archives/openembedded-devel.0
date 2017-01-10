Return-Path: <b.hutchman@gmail.com>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id BE09A719C4
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 22:27:17 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id r144so8922692wme.1
	for <Openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jan 2017 14:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=A25znkuCv55ncLqrg0AoQVuHO/+mvvh0Z5TSaslO8AA=;
	b=M6DVM+cPWjrBFA2ADvqOF+hvqYN9qIDP5ywdIQQpKkk5S1rROOBtIbnYgHUwANslgI
	E+Z0O3oCD4ioZYAmXpVggryJB5TAuaS+vi7mkECA0GdKZo2gh/SyGtDwfC6KqPiqDNB2
	Ait0jddfxkfrx/A7iqSne0TThUQjqAgVC1HAyG5H1eeEYp8bhFG+8Vsn6Nof8FFcP20I
	PSv8x5i232rfzZVuvOZcF8+KOv9MXqEpSseOyg41GHva7q8JvN7PFd12AJUvNhM2AxnT
	pKH8vu/uLAG6FmBls2yJDH6heThIyseCCMMz+OI8Puvp+qOGkuvHutnq4a5gSb6+2O5Y
	HAFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=A25znkuCv55ncLqrg0AoQVuHO/+mvvh0Z5TSaslO8AA=;
	b=psSQ7tI22JRjElHHOds2z1VKJBQFUwt2FwBNcM4RZvaO8YjemLp2k5Q/yY/DZGkzZF
	eWhcFrzRIL+5cc8A26wSwyJWJGjA+xvCWFVQX98xbKvbVVzBo+jLiF0a4RmiXvuyO5/+
	pw2zQJ+W1rCRxp8YlzQ/Dj5Xteuw/IkJRoVgt/82+nG5AjOHNmf6teU8iWF0QcrjyDpV
	4geGfTOZXSBrFPeoTftSfy2hm31cmTL0d5vGDPy5x7Rs4DD6emsBCy2lFSyA8oZaFqax
	k0UGbIw2oD09nBMj09nHYdjFaRu5lGnwYJdra27PewT8GIrkAziekafhuLHFNl4m6jhX
	AhuA==
X-Gm-Message-State: AIkVDXI8rbQkmXZCvCJVZCejz/yqkBez/ObyRMt0tvA81NLWSQHxbNU/lVq8AGB+4d2PWdWSyhZZCySBv2dqSw==
X-Received: by 10.28.8.12 with SMTP id 12mr1211375wmi.46.1484087237322; Tue,
	10 Jan 2017 14:27:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.194.44.227 with HTTP; Tue, 10 Jan 2017 14:27:16 -0800 (PST)
In-Reply-To: <CAFZh4h8iVD+ddmhzuBgcen4AhFhCVGE36z5KZaEBs9uOROsHgA@mail.gmail.com>
References: <CAFZh4h8iVD+ddmhzuBgcen4AhFhCVGE36z5KZaEBs9uOROsHgA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
Date: Tue, 10 Jan 2017 17:27:16 -0500
Message-ID: <CAFZh4h-SxdE7Vu1YbRYwiAostz1mB9h=XC6mqfCvQ6qwuDBQag@mail.gmail.com>
To: Openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver]
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
X-List-Received-Date: Tue, 10 Jan 2017 22:27:18 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 10, 2017 at 5:07 PM, Brian Hutchinson <b.hutchman@gmail.com> wrote:
> In both krogoth and morty I get the following error trying to build apache2:
>
> WARNING: apache2-native-2.4.23-r0 do_fetch: Failed to fetch URL
> http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2, attempting
> MIRRORS if available
> ERROR: apache2-native-2.4.23-r0 do_fetch: Fetcher failure: Fetch
> command failed with exit code 8, output:
> http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2:
> 2017-01-10 16:47:16 ERROR 404: Not Found.
>
> ERROR: apache2-native-2.4.23-r0 do_fetch: Function failed: Fetcher
> failure for URL:
> 'http://www.apache.org/dist/httpd/httpd-2.4.23.tar.bz2'. Unable to
> fetch URL from any source.
> ERROR: Logfile of failure stored in:
> /home/hutch/yocto_2.1.2_bbb/layers/poky/build/tmp/work/x86_64-linux/apache2-native/2.4.23-r0/temp/log.do_fetch.17534
> ERROR: Task 1098
> (/home/hutch/yocto_2.1.2_bbb/layers/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb,
> do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1033 tasks of which 0 didn't need to be
> rerun and 1 failed.
> Waiting for 0 running tasks to finish:
>
> Summary: 1 task failed:
>   /home/hutch/yocto_2.1.2_bbb/layers/meta-openembedded/meta-webserver/recipes-httpd/apache2/apache2-native_2.4.23.bb,
> do_fetch
>
>
> If I go to the URL in the recipe there is no httpd-2.4.23.tar.bz2.
> Looks like it's been replaced with 2.4.25.
>
> Regards,
>
> Brian


Ooops, I see this was recently talked about.  Sorry for the noise.  I
just modified my recipe to use archive to get around the problem as I
don't know what's involved with updating to 2.4.25 ... I've never
found cross compiling Apache for an embedded device (anything other
than x86) trivial.

Regards,

Brian

