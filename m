Return-Path: <lukas.bulwahn@oss.bmw-carit.de>
Received: from linuxmail.bmw-carit.de (mail.bmw-carit.de [62.245.222.98])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3156C7A6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Sep 2013 05:00:53 +0000 (UTC)
Received: from [192.168.101.5] (afplatform.bmw-carit.intra [192.168.101.5])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukas.bulwahn)
	by linuxmail.bmw-carit.de (Postfix) with ESMTPSA id 8187D4007F;
	Tue, 17 Sep 2013 05:57:59 +0200 (CEST)
Message-ID: <5237E205.8060508@oss.bmw-carit.de>
Date: Tue, 17 Sep 2013 07:00:53 +0200
From: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAKS01onp9CcPLNOybKbTh9bsp4QwuLJtJABrU7_zDe=Px0t6Nw@mail.gmail.com>
	<02f901ceb2d2$d93db7e0$8bb927a0$@oss.bmw-carit.de>
	<CAKS01ondqDK+WSxXaFSSk6_gBp5V9A6=Qh7g_TQz8WWUAaoHhQ@mail.gmail.com>
In-Reply-To: <CAKS01ondqDK+WSxXaFSSk6_gBp5V9A6=Qh7g_TQz8WWUAaoHhQ@mail.gmail.com>
Subject: Re: using deb as source while building image.
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
X-List-Received-Date: Tue, 17 Sep 2013 05:00:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/16/2013 02:32 PM, Anup Kini wrote:
> I am trying to understand how deb packages can be used to build the image.
> Since, i need to install a few pre-built application.
> let me know if you have any pointers on how to proceed with this.
>
>
If you have the source code available, I believe it is much easier to 
write a proper recipe than to use a prebuilt binary, which you do not 
know the exact compiler flags, which libraries you need to dynamically 
link to, etc.

However, maybe someone on the mailing list has already some experience 
trying to integrate prebuilt binaries into the images.

Lukas

