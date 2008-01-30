Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JKAGi-0003MP-Po
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Jan 2008 11:34:12 +0100
Received: by ug-out-1314.google.com with SMTP id i24so342486ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Jan 2008 02:34:20 -0800 (PST)
Received: by 10.66.245.12 with SMTP id s12mr2618749ugh.26.1201689259914;
	Wed, 30 Jan 2008 02:34:19 -0800 (PST)
Received: from widy.localdomain ( [88.231.85.252])
	by mx.google.com with ESMTPS id 19sm5201153ugl.13.2008.01.30.02.34.17
	(version=SSLv3 cipher=OTHER); Wed, 30 Jan 2008 02:34:18 -0800 (PST)
Date: Wed, 30 Jan 2008 12:45:44 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080130124544.1f562944@widy.localdomain>
In-Reply-To: <1201544344.5882.45.camel@hammer.suse.cz>
References: <1201544344.5882.45.camel@hammer.suse.cz>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.1; i686-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [patch commit request] kdrive xserver: support for key codes	128-255
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
X-List-Received-Date: Wed, 30 Jan 2008 10:34:13 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Mon, 28 Jan 2008 19:19:04 +0100
Stanislav Brabec <utx@penguin.cz> wrote:

> Hallo.
> 
> Would be anybody with commit privileges to OE mtn so kind and review
> and commit attached fixes regarding keycodes 128-255 in kdrive
> xserver.
> 
> It is required for input devices generating these key codes (e. g.
> Sharp CE-RH2 on Zaurus Spitz/Akita).
> 
> This patch works perfectly for me for more than half year.
> 
> Patch is not device specific and should work for all input devices. It
> was reviewed by the Linux Extended MEDIUMRAW mode author.
> 
> Attached mtn patch fixes
> http://bugs.openembedded.org/show_bug.cgi?id=2637
> [Bug 2637] fixes to make Sharp CE-RH2 remote working in X
> 
> This bug remains for more than half year without any response.
> 
> This bug is also pending in upstream as
> http://bugs.freedesktop.org/show_bug.cgi?id=11545
> [Bug 11545] patch to support Linux Extended MEDIUMRAW keyboard mode

Can you please elaborate what the application of this patch would mean
for OE (besides fixing support for one specific obscure peripheral)? 

Based on this comment: "Note: Extended MEDIUMRAW mode and evdev mode
should provide the same keycodes" in
http://bugs.freedesktop.org/show_bug.cgi?id=11545 , I would think that
it would bring us interface-stable workaround until X.org and we fully
convert to evdev? Is that how you perceive it? Should we declare the
problem of 8-bit keycodes solved right now, and stop recommending
kernel developers to fit their keys into 7 bits? Is this patch suitable
for merging to stable branch?


Thanks,
Paul


