Received: from [209.85.134.188] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I7taB-00019G-Oz
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 15:47:19 +0200
Received: by mu-out-0910.google.com with SMTP id w9so657796mue
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2007 06:41:44 -0700 (PDT)
Received: by 10.82.146.14 with SMTP id t14mr8242095bud.1183988504379;
	Mon, 09 Jul 2007 06:41:44 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id w7sm55043330mue.2007.07.09.06.41.42
	(version=SSLv3 cipher=OTHER); Mon, 09 Jul 2007 06:41:42 -0700 (PDT)
Date: Mon, 9 Jul 2007 16:41:28 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <1211634359.20070709164128@gmail.com>
To: Graeme Gregory <dp@xora.org.uk>
In-Reply-To: <20070709131744.GC2336@p3n3tr4t0r.internal>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<20070709131744.GC2336@p3n3tr4t0r.internal>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 13:47:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Graeme,

Monday, July 9, 2007, 4:17:44 PM, you wrote:

> On Mon, Jul 09, 2007 at 03:43:03PM +0300, Paul Sokolovsky wrote:
>>   As was pointed out, interpretation of those vars should depend on
>> presence of "screen" in machine features. And yes, then we need to set
>> their bitbake.conf default to 0, so only screen'ed machines specify
>> them.
>> 
>>   Also a note of exact semantics of those vars - they provide *some
>> default* screen resolution and orientation. Actually not some, but the
>> most appropriate after-install default. So, in particular,
>> notebook-style keyboarded devices would have:
>> 
>> MACHINE_DISPLAY_WIDTH_PIXELS=640
>> MACHINE_DISPLAY_HEIGHT_PIXELS=480
>> 
>> A device with vertical PDA layout would have
>> 
>> MACHINE_DISPLAY_WIDTH_PIXELS=480
>> MACHINE_DISPLAY_HEIGHT_PIXELS=640
>> 

> The problem with this interpretation is that although spitz boots and looks
> like it is 640x480 it is in fact 480x640 with rotation. So it may just
> be a mistake in your example that spitz happens to show up. Or it may be
> something that has not been considered.

That's just low-level details, which would be handled on another
level. I have specific usecase for this on which I model this initial
usage: background images for OPIE. So, what would you prefer for
spitz: having a landscape or portrait background by default? That's
what should go into those vars. Of course, for other uses we may need
another interpretation, for example, add function which will
"normalize" resolution (w >= h for example), or just return largest of
them, etc.

And rotation may need special support, and then DPI too. Just let's
start with specific itches first and elaborate on that. Actual pixel
dimension is the objective parameter, so we're not on the wrong track.

> Graeme


> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



