Received: from [76.96.30.80] (helo=QMTA08.emeryville.ca.mail.comcast.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1MtN8u-0003ln-Dz
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Oct 2009 17:00:31 +0200
Received: from OMTA02.emeryville.ca.mail.comcast.net ([76.96.30.19])
	by QMTA08.emeryville.ca.mail.comcast.net with comcast
	id nSTa1c0040QkzPwA8Szk47; Thu, 01 Oct 2009 14:59:44 +0000
Received: from [192.168.1.104] ([67.188.141.116])
	by OMTA02.emeryville.ca.mail.comcast.net with comcast
	id nSzi1c00R2WszPn8NSzjp6; Thu, 01 Oct 2009 14:59:43 +0000
Message-ID: <4AC4C3DA.4010904@comcast.net>
Date: Thu, 01 Oct 2009 07:59:38 -0700
From: Ed Nelson <enelson1000@comcast.net>
User-Agent: Thunderbird 2.0.0.23 (Windows/20090812)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1254372443.6756.1.camel@ed-hp-laptop>
	<200910010700.39010.holger+oe@freyther.de>
In-Reply-To: <200910010700.39010.holger+oe@freyther.de>
X-SA-Exim-Connect-IP: 76.96.30.80
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Creating the CheckSum parser failed
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
X-List-Received-Date: Thu, 01 Oct 2009 15:00:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Hans Peter Freyther wrote:
> On Thursday 01 October 2009 06:47:23 ed wrote:
>   
>> What am I missing that keeps causing this message to be printed out in
>> the log.
>>
>> NOTE: Running task 10 of 2678 (ID:
>> 815,
>>  /home/ed/mini2440/OE/mini2440/recipes/stage-manager/stagemanager-native_0.
>> 0.1.bb, do_setscene) NOTE: Running task 11 of 2678 (ID:
>> 816,
>>  /home/ed/mini2440/OE/mini2440/recipes/stage-manager/stagemanager-native_0.
>> 0.1.bb, do_fetch) NOTE: Creating the CheckSum parser failed
>>     
>
> Wow that is a crappy message that I created (I always bitch about bad error
> messages myself). This message is generated in classes/base.bbclass and
> could you try the following patch?
>
>
>
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index d29ba4b..89ee917 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -661,7 +661,7 @@ python base_do_fetch() {
>                 bb.note("No conf/checksums.ini found, not checking checksums")
>                 return
>         except:
> -               bb.note("Creating the CheckSum parser failed")
> +               bb.note("Creating the CheckSum parser failed: %s:%s" % (sys.exc_info()[0], sys.exc_info()[1]))
>                 return
>  
>         pv = bb.data.getVar('PV', d, True)
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>   
Thanks

That did the trick.
It reported parsing errors in checksum.ini file.
    line 27362 '====\n'
    line 27373 '====\n'
etc

Removed them from file and now no more errors.
Thanks again.


