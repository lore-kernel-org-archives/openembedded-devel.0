Received: from [81.228.11.98] (helo=pne-smtpout1-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MbXTw-0000rD-Te
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 12:24:28 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout1-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A683C78001BA2A7 for openembedded-devel@lists.openembedded.org;
	Thu, 13 Aug 2009 12:07:57 +0200
Message-ID: <4A83E5FC.2020002@atmel.com>
Date: Thu, 13 Aug 2009 12:07:56 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A83BD15.7070006@atmel.com> <h60je5$992$1@ger.gmane.org>
In-Reply-To: <h60je5$992$1@ger.gmane.org>
Subject: Re: Ideas for scripts, to save work, when building several boards
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
X-List-Received-Date: Thu, 13 Aug 2009 10:24:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Koen Kooi skrev:
> On 13-08-09 09:13, Ulf Samuelsson wrote:
>> Since I will need to test multiple boards,
>> I decided to write some scripts which I will
>> check in later today in origin/ulf/linux-2.6.30.2
>>
>> I generated a "MAKEALL" script which will
>> source a file "board_list.sh" with board build commands
>>
>> <SOF>
>> build_board    sam9263dfc    x11-gpe-image
>> build_board    sam9g45ek    opie-image
>> build_board    sam9g10df    x11-gpe-image
>> build_board    sam9g20dfc    console-image
>> build_board    sam9260dfc    console-image
>> build_board    sam9261df    x11-image
>> build_board    sam9xedfc    console-image
>> <EOF>
> 
> You do know that you can do that with MACHINE=foo bitbake bar, right?
> 

Didn't try that.
I assume this means that the cross compiler is not rebuilt,
Is the root fs assembled from ipks then?


> regards,
> 
> Koen
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Best Regards
Ulf Samuelsson



