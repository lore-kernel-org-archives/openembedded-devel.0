Received: from [209.85.134.190] (helo=mu-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I7sfi-0004Ot-0n
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 14:48:58 +0200
Received: by mu-out-0910.google.com with SMTP id w9so640341mue
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Jul 2007 05:43:23 -0700 (PDT)
Received: by 10.82.182.1 with SMTP id e1mr8097370buf.1183985003423;
	Mon, 09 Jul 2007 05:43:23 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id j2sm54311167mue.2007.07.09.05.43.22
	(version=SSLv3 cipher=OTHER); Mon, 09 Jul 2007 05:43:22 -0700 (PDT)
Date: Mon, 9 Jul 2007 15:43:03 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <128309124.20070709154303@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <f6q30v$s2$1@sea.gmane.org>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
MIME-Version: 1.0
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
X-List-Received-Date: Mon, 09 Jul 2007 12:48:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,


      To sum app current discussion:

Sunday, July 8, 2007, 10:16:46 AM, you wrote:


> Paul Sokolovsky schreef:
>> Hello openembedded-devel,
>> 
>>   We already discussed issue of providing more exact device screen
>> properties info than currently available screen classes "smallscreen"
>> and "bigscreen". I for one was proponent of staying with those classes
>> instead of hasting with introducing too many screen parameters without
>> proper way of handling them in OE. However, it's just the matter of
>> fact that at least the most basic of them, like screen dimensions are
>> already in use by more than one package (I can point to opie and
>> fbreader out of top of mind), and so far in adhoc manner, so
>> standardizing them would be beneficial.
>> 
>>   When discussing this on IRC, Marcin Juszkiewicz pointed me to Poky's
>> formfactor package, designed to query various device properties at
>> runtime (including current screen resolution).
>> http://svn.o-hand.com/view/poky/trunk/meta/packages/formfactor/

> Formfactor is a hack that does nothing what our Xserver scripts and HAL+OHM can't do.

  Oh, I guess it's the other way around - it's a simple config and
shell script which can do things for which whole big daemons with
gross dependencies are required ;-).

  More seriously, it makes no sense to ignore the fact that X with
freedesktop.org's novelties is not the only and won't become the only
choice for embedded GUI. Many adhoc toolkits pop up, and some of them
will be leveraged by vendors and it makes no sense to say that OE is
not place for them (though community distros are of course much less
interested in them). It would be nice to anticipate the need for a
lightweight, flexible, and consistent way to query device params for
them.

> And
> we were explicitly asked *not* to merge it into OE by someone from o-hand.

   Pity.

>>   I think that it is great tool, and we should merge and leverage it
>> in OE by all means. But it handles only runtime configuration,

> And we already have sufficient tools inplace to handle that, formfactor just muddies the
> waters.

  Hopefully cleans up, though yes, it opens question that GPE scripts
would be needed converted to it, etc.

> And if you take a closer look at formfactor, you'll notice it's internally
> inconsistent (e.g. dpi = resolution/size, but you need to specify all 3 in formfactor)

  If division is banned from kernel, why not ban it from shell
scripts? ;-)

>>    Now with formfactor around, I guess it would be nice to use
>> consistent variable names for the same info. Marcin still suggested to
>> use MACHINE_ prefix for build-time (i.e. machine config) variables.
>> So, the exact topic of this RFC is adding
>> 
>> MACHINE_DISPLAY_WIDTH_PIXELS=
>> MACHINE_DISPLAY_HEIGHT_PIXELS=
>> 
>> to machine configs.

> We can add those without adding formfactor.

  Sure, and only that is in immediate topic, of course.

> But what will those setting be for e.g. an nslu2 or efika board?

  As was pointed out, interpretation of those vars should depend on
presence of "screen" in machine features. And yes, then we need to set
their bitbake.conf default to 0, so only screen'ed machines specify
them.

  Also a note of exact semantics of those vars - they provide *some
default* screen resolution and orientation. Actually not some, but the
most appropriate after-install default. So, in particular,
notebook-style keyboarded devices would have:

MACHINE_DISPLAY_WIDTH_PIXELS=640
MACHINE_DISPLAY_HEIGHT_PIXELS=480

A device with vertical PDA layout would have

MACHINE_DISPLAY_WIDTH_PIXELS=480
MACHINE_DISPLAY_HEIGHT_PIXELS=640

  Otherwise, I assume the names are OK.

> regards,

> Koen



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



