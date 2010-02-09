Received: from qw-out-1920.google.com ([74.125.92.148])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NeuVy-0005mx-61
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Feb 2010 19:08:49 +0100
Received: by qw-out-1920.google.com with SMTP id 5so712936qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 10:06:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.142.4.13 with SMTP id 13mr997563wfd.65.1265738773976; Tue, 09 
	Feb 2010 10:06:13 -0800 (PST)
In-Reply-To: <89CD81306A03F24FAEA2177A341C2C613B8764@XMB-RCD-209.cisco.com>
References: <89CD81306A03F24FAEA2177A341C2C613B8764@XMB-RCD-209.cisco.com>
Date: Tue, 9 Feb 2010 10:06:13 -0800
Message-ID: <18e217241002091006t1482a491o93c3a5dfa8a3ab83@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.148
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: initramfs image with secondary cramfs inside
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Feb 2010 18:08:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

In otherwords has anyone had any success with making one image depend upon a
2nd image?

if you what did you do to make that work.
mike


On Mon, Feb 8, 2010 at 4:37 PM, John Van Horne (vanhorj)
<vanhorj@cisco.com>wrote:

> The system I'm working on boots up with an initramfs image which
> contains a very minimal file system. During the boot process, a second
> file system image, in cramfs format, is mounted and used as the root
> file system. Does anyone have any experience using OE to build such an
> image? My approach to this was to have a recipe for the cramfs image and
> a recipe for the initramfs image, and to list the cramfs image as a
> dependency of the initramfs recipe. Both of these recipes inherit the
> image class. However, running bitbake on the initramfs recipe fails
> because the cramfs do_rootfs and do_deploy_to tasks have not run. After
> running bitbake with debug info turned on, it seems that the initramfs
> recipe depends upon the do_populate_stage task of cramfs, but not
> do_rootfs and do_deploy_to. Could anyone offer any insight into why this
> is?
>
>
>
> Thanks
>
> -John
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

