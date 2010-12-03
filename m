Received: from sj-iport-4.cisco.com ([171.68.10.86])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hgune@cisco.com>) id 1POPK2-0000PS-An
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 07:40:50 +0100
Authentication-Results: sj-iport-4.cisco.com;
	dkim=neutral (message not signed) header.i=none
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AmYFAFMf+ExAaMHG/2dsb2JhbACVG44WcaZxmxmFRwSEXIUbcYMRgnI
X-IronPort-AV: E=Sophos;i="4.59,292,1288569600"; d="scan'208";a="226969447"
Received: from syd-core-1.cisco.com ([64.104.193.198])
	by sj-iport-4.cisco.com with ESMTP; 03 Dec 2010 06:39:19 +0000
Received: from [64.104.132.131] (dhcp-64-104-132-131.cisco.com
	[64.104.132.131])
	by syd-core-1.cisco.com (8.13.8/8.14.3) with ESMTP id oB36dEOU020652
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 3 Dec 2010 06:39:14 GMT
Message-ID: <4CF8908F.7030505@cisco.com>
Date: Fri, 03 Dec 2010 12:09:11 +0530
From: harshada <hgune@cisco.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CF4B540.4020108@cisco.com>	<4CF67A98.2010708@gmail.com>
	<AANLkTimqLt1knQWUZiDEGs4H-kf=o-2o9vRkcwPU4pRZ@mail.gmail.com>
In-Reply-To: <AANLkTimqLt1knQWUZiDEGs4H-kf=o-2o9vRkcwPU4pRZ@mail.gmail.com>
X-SA-Exim-Connect-IP: 171.68.10.86
X-SA-Exim-Mail-From: hgune@cisco.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: gstreamer not getting populated in file system
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
X-List-Received-Date: Fri, 03 Dec 2010 06:40:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi Maksym,
   Thanks for reply. I added a task called mytask as follows:
PACKAGES = "task-mytask"

RDEPENDS_task-mytask = " strace \
             gstreamer \
             gst-meta-base \
             gst-plugins-base \
             gst-plugins-good \
             gst-plugins-bad \
             gst-plugins-ugly "

DEPENDS_task-mytask = " "

RRECOMMENDS = " strace \
             gstreamer \
             gst-meta-base \
             gst-plugins-base \
             gst-plugins-good \
             gst-plugins-bad \
             gst-plugins-ugly "

And used it while creating image. But still I am not able to see the 
gstreamer plugins populated.
I couldn't find any other meta bb file except gst-meta-base. What could 
be the wrong?

~Harshada.


On Thursday 02 December 2010 02:56 PM, Maksym Parkachov wrote:
> Hi Harshada,
>
> I've seen the same behavior as you, instead of gst-plugins-base you
> need to use gst-plugins-base-meta, and correspondingly all other as
> well. During last couple of months gst-plugins-base, .etc. changed
> dependency on plugins from DEPENDS to RECOMMENDS.
>
> Hope this helps,
> Maksym.
>
> On Wed, Dec 1, 2010 at 5:40 PM, Tim Harvey<harvey.tim@gmail.com>  wrote:
>    
>> On 11/30/2010 12:26 AM, harshada wrote:
>>      
>>> We created new image by adding following into minimal-image.bb:
>>> gstreamer \
>>> gst-plugins-base \
>>> gst-plugins-good \
>>> gst-plugins-bad \
>>> gst-plugins-ugly
>>> Image is getting built without any compiling issues. But we are not able
>>> to find required
>>> gstreamer plugins in the file system image. In ipk directory, we could
>>> find all of the corresponding ipks.
>>> What to do to get the filesystem populated with these gstreamer plugins?
>>>
>>> thanks and regards,
>>> Harshada
>>>        
>> I believe you need to place the actual plugins in your image - do a find
>> tmp/deploy/ipk -name gst-plugin-*
>>
>> Tim
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>      
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>    



