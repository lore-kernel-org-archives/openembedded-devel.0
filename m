Received: from [66.249.82.238] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <myopiate@gmail.com>) id 1Gi5Nz-0000yl-33
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Nov 2006 09:35:47 +0100
Received: by wx-out-0506.google.com with SMTP id t14so116788wxc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Nov 2006 00:34:12 -0800 (PST)
Received: by 10.70.8.8 with SMTP id 8mr253876wxh.1163061252467;
	Thu, 09 Nov 2006 00:34:12 -0800 (PST)
Received: by 10.70.130.3 with HTTP; Thu, 9 Nov 2006 00:34:12 -0800 (PST)
Message-ID: <e83232070611090034w5e22d6f0i92743439c9a5f7bf@mail.gmail.com>
Date: Thu, 9 Nov 2006 16:34:12 +0800
From: "Roderick Taylor" <myopiate@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4552AB62.3080106@gmail.com>
MIME-Version: 1.0
References: <4552AB62.3080106@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: Re: What machine/distro should I use for my PXA270 board?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 09 Nov 2006 08:35:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Angstrom should be good.

Look at the ENABLE_BINARY_LOCAL_GENERATION option in your local.conf

Disabling this option stops the building of qemu-native.  The problem you
could be having is that qemu-native needs GCC < 4.0 to compile properly and
your distro uses > 4.0

I got an Angstrom bootstrap-image to build an h2200 (quite a while ago, but
I had a similar issue)

I don't know if firefox or minimo will work though...

Rod

On 11/9/06, DAMWID <damwid@gmail.com> wrote:
>
> Hi all,
>
> I'm new to openembedded, try to build a root filesystem with gnueabi
> support for my pxa270 board, and don't care about the kernel. I have
> tried spitz/angstrom, but failed to build qemu, also tried
> spitz/openomap, but firefox failed to run with error "Illegal
> instruction" and minimo segfault. So, which machine/distro pair should I
> use? Can anyone help?
>
> Thanks,
>
> Damwid
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

