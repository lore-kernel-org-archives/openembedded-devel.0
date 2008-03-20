Received: from [209.85.162.183] (helo=el-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <pmiscml@gmail.com>) id 1JcPyD-0007oD-Ie
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Mar 2008 19:58:35 +0100
Received: by el-out-1112.google.com with SMTP id r23so918346elf.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Mar 2008 11:58:32 -0700 (PDT)
Received: by 10.114.156.1 with SMTP id d1mr3948398wae.120.1206039512223;
	Thu, 20 Mar 2008 11:58:32 -0700 (PDT)
Received: from widy.localdomain ( [88.252.175.177])
	by mx.google.com with ESMTPS id 1sm3428666nfv.3.2008.03.20.11.58.28
	(version=SSLv3 cipher=OTHER); Thu, 20 Mar 2008 11:58:30 -0700 (PDT)
Date: Thu, 20 Mar 2008 21:00:20 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20080320210020.1fc57e44@widy.localdomain>
In-Reply-To: <d46153c40803200540h522b735cq483a8f510020fe09@mail.gmail.com>
References: <d46153c40803200540h522b735cq483a8f510020fe09@mail.gmail.com>
X-Mailer: Claws Mail 3.0.2 (GTK+ 2.12.8; i686-pc-linux-gnu)
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 209.85.162.183
X-SA-Exim-Mail-From: pmiscml@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,BAYES_50,RDNS_NONE
	autolearn=no version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] ipaq-sleep backlight control
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
X-List-Received-Date: Thu, 20 Mar 2008 18:58:35 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hello,

On Thu, 20 Mar 2008 07:40:27 -0500
"Andrew Paulsen" <andrew.paulsen@gmail.com> wrote:

> I did a code cleanup on ipaq-sleep and added the option to use your
> own backlight control script instead of gpe-conf to adjust brightness.
> 
> http://bugs.openembedded.org/show_bug.cgi?id=4101
> 
> I have since heard that all 2.6 devices use the standard
> /sys/class/backlight/*/ method to control brightness and that we don't
> need/want to support others.
> 
> So I have three options and I'd like some opinions:
> 1) Leave ipaq-sleep the way it is and ship a standard backlight
> control script that can be overridden/changed per machine.  This still
> allows the legacy gpe-conf method (the default right now)
> 2) Have ipaq-sleep write directly to /sys/class/backlight/*/ to tweak
> the brightness and skip this whole mess
> 3) Have the option to select between 1&2 via conf file entry

IMHO, ipaq-sleep should go to /dev/null. Long-term, it should be
replaced by that mythical "machine daemon" which sometimes appear in
blogs and ML conversations. Short-time, I wrote another, sane
and efficient backlight control daemon, packages/backsaver/ in OE. That
still leaves question on suspending device after timeout open though.
My plan was to do gradual conversion (disable backlight control in
ipaq-sleep, use backsaver for that, with it still using ipaq-sleep's
config), but I had to put that on hold, as there're just too many
things I have in works already...

> 
> Thanks!
> Andrew

[]


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com


