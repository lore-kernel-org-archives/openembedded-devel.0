Received: from [213.4.149.66] (helo=ctsmtpout2.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <joaquinduran@adtelecom.es>) id 1GZpnI-0007q9-U5
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Oct 2006 16:19:49 +0200
Received: from [194.179.62.31] (217.126.70.245) by ctsmtpout2.frontal.correo
	(7.2.056.6) (authenticated as joaquinduran$adtelecom.es)
	id 4526113E0015F573 for openembedded-devel@lists.openembedded.org;
	Tue, 17 Oct 2006 16:12:52 +0200
Message-ID: <4534F28F.3040506@adtelecom.es>
Date: Tue, 17 Oct 2006 16:11:11 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
User-Agent: Mozilla Thunderbird 1.5.0.7 (X11/20060926)
MIME-Version: 1.0
To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
References: <452BBCC8.5090505@adtelecom.es>
In-Reply-To: <452BBCC8.5090505@adtelecom.es>
Subject: Re: Problems with X11
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
X-List-Received-Date: Tue, 17 Oct 2006 14:19:49 -0000
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Dear all,

These days I've build several xterminal images. I would like to comment 
several issues that I've found:

1 - Some days ago, I've sent to this list the following e-mail:

> Dear all,
> 
> I don't know if this is an off-topic of this list, but I'll post.
> 
> I'm trying to start the Kdrive xserver (v. X11R7.1) with a window 
> manager (twm), generated from xterminal image. 'xinit' is also 
> installed, with fonts. Each time that I run 'startx' or 'xinit' the 
> following message is shown by kdrive:
> 
> Warning: X locale modifiers not supported, using default
> Warning: Unable to load any usable fontset
> Error: Aborting: no fontset found
> 
> How can I set up this locale? Any help will be appreciated.
> 
> 
> I've observed that if library hasn't any application depending on it, 
> the bitbake doesn't include the library to the image. Is this a bug?
> 
> Thanks and Best Regards,
> Joaquim Duran

The previous message is displayed by applications, and not by xserver. 
This is done by applications but not by all.

For example, I start the Xserver with some tools:

export DISPLAY=:0.0
Xfsev&
twm&
xeyes&
(Till here, all applications are working fine)
xedit&
(The application crashes and displays the previous message)

The locales of X11 are not installed. They should be placed in 
/usr/lib/X11/locale, but the folder is not present.


2 - From the last comment, that libraries should be included in the 
final image, I answered to a question that Xserver fonts should be 
installed by hand. Kdrive includes fonts internally so the installation 
of fonts for this xserver should be optional (I was wrong).


3 - The library libXaw version Xorg 7.1 has a dependency with libxp (as 
libXaw version Xorg 7.0). By the libxp has not been released for Xorg 
7.1 by Xorg. I've checked its FTP server and it hasn't been release form 
Xorg 7.1 but release notes tell nothing about deprecation. The 
dependency should be removed?


4 - The package xinit should have dependences to xmodmap and xrdb utils 
because these utils are called from xinitrc file.

If I should fill bugs for these items, please, let me know.

Thanks and Best Regards,
Joaquim Duran



