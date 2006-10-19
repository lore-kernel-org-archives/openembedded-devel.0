Received: from [64.233.166.177] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <axel.lin@gmail.com>) id 1GaUV3-0000zW-Fd
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Oct 2006 11:47:41 +0200
Received: by py-out-1112.google.com with SMTP id i75so705416pye
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Oct 2006 02:40:38 -0700 (PDT)
Received: by 10.35.77.18 with SMTP id e18mr12319163pyl;
	Thu, 19 Oct 2006 02:40:38 -0700 (PDT)
Received: by 10.35.15.3 with HTTP; Thu, 19 Oct 2006 02:40:38 -0700 (PDT)
Message-ID: <427d64720610190240r55311809y2a313d4055a10cc2@mail.gmail.com>
Date: Thu, 19 Oct 2006 17:40:38 +0800
From: "axel lin" <axel.lin@gmail.com>
To: "axel lin" <axel.lin@gmail.com>, openembedded-devel@lists.openembedded.org
In-Reply-To: <20061018203453.GA29721@twibble.org>
MIME-Version: 1.0
References: <427d64720610172317t1e89518bx16ffbdae70fdbfb4@mail.gmail.com>
	<200610180827.46349.openembedded@hrw.one.pl>
	<427d64720610180022p431603abpd3c035f0c79b8f5c@mail.gmail.com>
	<20061018203453.GA29721@twibble.org>
Subject: Re: Fail to start dropbear
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
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
X-List-Received-Date: Thu, 19 Oct 2006 09:47:42 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Thank you, Jamie.
I found the root cause of missing /dev/(u)random issue.
It is caused by missing "tmpfs" support in my kernel, as a result the
udev doesn't work.

Regards,
Axel


2006/10/19, Jamie Lenehan <lenehan@twibble.org>:
> On Wed, Oct 18, 2006 at 03:22:41PM +0800, "axel lin" wrote:
> [...]
> > Thanks, Marcin.
> > I fixed it by manually create the device file.
> > How to config OE to add a device file, then I don't have to manually add it.
>
> If you are using udev then udev should be creating /dev/random and
> /dev/urandom (along with lots of other stuff). I don't think anything
> special is required to get udev to created this.
>
> If you really do want to add device nodes manually (which is probably wrong)
> then see the "Device (/dev) nodes" section of the "image_ipkg class"
> in the user manual:
>
>   http://www.openembedded.org/user-manual&dpage=ch07s05
>
> --
>  Jamie Lenehan <lenehan@twibble.org>
>


