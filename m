Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 62C1A6E91D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  3 Feb 2014 17:43:19 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 2ADC6F811D8; Mon,  3 Feb 2014 10:43:20 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 57F4BF8119A;
	Mon,  3 Feb 2014 10:43:16 -0700 (MST)
Message-ID: <52EFD53A.8060009@mlbassoc.com>
Date: Mon, 03 Feb 2014 10:43:22 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CACgAsMeiKrLgjPnsZwOJtncRJ4nKExvjtS23VXNXcwyMsWtaDw@mail.gmail.com>
	<20140203173755.GE3698@jama>
In-Reply-To: <20140203173755.GE3698@jama>
Subject: Re: meta-qt5
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
X-List-Received-Date: Mon, 03 Feb 2014 17:43:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 2014-02-03 10:37, Martin Jansa wrote:
> On Mon, Feb 03, 2014 at 12:07:30PM -0500, Kevyn-Alexandre Paré wrote:
>> Morning Martin,
>
> morning,
>
>> I found your email from here:
>> http://layers.openembedded.org/layerindex/branch/master/layer/meta-qt5/
>>
>> I'm searching for help on that package/doc
>>
>> If you prefer I can send my question to a specific mailing list if you
>> pin point me where?
>
> openembedded-devel@lists.openembedded.org is better place (see README
> file)
>
>> So my goal is to run qt5 on my OMAP3 board by using yocto.
>>
>> I have fallow :
>> http://wiki.wandboard.org/index.php/Building_Qt5_using_yocto_on_Wandboard
>> and &
>> http://gpupowered.org/node/20
>>
>> Try to run this:
>> root@overo:/# export QT_DEBUG_BACKINGSTORE=1
>> root@overo:/# export QT_QPA_PLATFORM=minimal
>> root@overo:/# Qt5_CinematicExperience -plugin tslib
>> libpng warning: iCCP: known incorrect sRGB profile
>> libpng warning: iCCP: known incorrect sRGB profile
>> This plugin does not support createPlatformOpenGLContext!
>> QtQuick: failed to create OpenGL context
>> This plugin does not support createPlatformOpenGLContext!
>> QtQuick: failed to create OpenGL context
>>
>> Result:
>> nothing is visible on my LCD except the console...
>>
>> So do you have any idea where I should start digging to simply start
>> by making a qt5 example run on my board?
>
> I've no experience with wandaboard, but few people asked about it with
> relation to qt5, so maybe someone will respond on ML.
>

This works on my SabreLite which I built without X11 support.  I did not
use any of your QT_xxx exports, only this command line.

   # Qt5_CinematicExperience -platform eglfs -plugin tslib:/dev/input/touchscreen0

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

