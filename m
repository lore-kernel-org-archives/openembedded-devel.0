Received: from [64.233.166.176] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <leon.woestenberg@gmail.com>) id 1GZCpr-0004Q8-9E
	for openembedded-devel@lists.openembedded.org;
	Sun, 15 Oct 2006 22:43:51 +0200
Received: by py-out-1112.google.com with SMTP id i75so1852068pye
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Oct 2006 13:36:36 -0700 (PDT)
Received: by 10.65.234.2 with SMTP id l2mr8806917qbr;
	Sun, 15 Oct 2006 13:36:35 -0700 (PDT)
Received: by 10.65.230.8 with HTTP; Sun, 15 Oct 2006 13:36:35 -0700 (PDT)
Message-ID: <c384c5ea0610151336w210b8658i63817e29d344aa36@mail.gmail.com>
Date: Sun, 15 Oct 2006 22:36:35 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: "Using the OpenEmbedded metadata to build Linux Distributions"
	<openembedded-devel@lists.openembedded.org>
In-Reply-To: <20061015145613.ovhqbcfhdndc888c@webmail.neophob.com>
MIME-Version: 1.0
References: <20061015145613.ovhqbcfhdndc888c@webmail.neophob.com>
Subject: Re: build cairo
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 15 Oct 2006 20:43:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On 10/15/06, michu@neophob.com <michu@neophob.com> wrote:
> hello
>...
> directfb is compiled. so i try to create the cairo package, the configuration
> step is fine but the compilation fails:
>
> | NOTE: make
> | make  all-recursive
> | make[1]: Entering directory `/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4'
> ...
> |  arm-linux-gcc -mcpu=arm9tdmi -mtune=arm9tdmi -DHAVE_CONFIG_H -I.
> -I/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/src -I..
> -I/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/src
> -I/stuff/tmp/work/cairo-1.2.4-r1/cairo-1.2.4/pixman/src
> -I/stuff/tmp/staging/arm-linux/include/freetype2
> -I/stuff/tmp/staging/arm-linux/include -D_REENTRANT
> -I/stuff/tmp/staging/arm-linux/include/directfb -I/usr/include/directfb

Note the two include search directories, the latter is wrong.

> any hints?
>
Although directfb builds, its build is probably in the sense that it
leaves behind host directories somewhere in its (libconfig?
pkgconfig?) files.

Regards,

LEon.

-- 
Leon


