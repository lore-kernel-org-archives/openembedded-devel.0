Received: from [91.121.27.225] (helo=26.mail-out.ovh.net)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <eric@eukrea.com>) id 1MwFIF-0002i1-4f
	for openembedded-devel@openembedded.org; Fri, 09 Oct 2009 15:14:02 +0200
Received: (qmail 4265 invoked by uid 503); 9 Oct 2009 13:13:10 -0000
Received: from 42.mail-out.ovh.net (213.251.189.42)
	by 26.mail-out.ovh.net with SMTP; 9 Oct 2009 13:13:09 -0000
Received: (qmail 30696 invoked by uid 503); 9 Oct 2009 13:13:37 -0000
Received: from b9.ovh.net (HELO mail422.ha.ovh.net) (213.186.33.59)
	by 42.mail-out.ovh.net with SMTP; 9 Oct 2009 13:13:37 -0000
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 9 Oct 2009 13:13:38 -0000
Received: from pac33-2-82-240-38-71.fbx.proxad.net (HELO ?192.168.1.15?)
	(ebenard%eukrea.com@82.240.38.71)
	by ns0.ovh.net with SMTP; 9 Oct 2009 13:13:37 -0000
Message-ID: <4ACF36E3.3000906@eukrea.com>
Date: Fri, 09 Oct 2009 15:13:07 +0200
From: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4ACEFD4C.6060606@dresearch.de> <4ACF317D.7060808@dresearch.de>
In-Reply-To: <4ACF317D.7060808@dresearch.de>
X-Ovh-Tracer-Id: 3963449147958734153
X-Ovh-Remote: 82.240.38.71 (pac33-2-82-240-38-71.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-SA-Exim-Connect-IP: 91.121.27.225
X-SA-Exim-Mail-From: eric@eukrea.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build exception in sgmlspl-native
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
X-List-Received-Date: Fri, 09 Oct 2009 13:14:02 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

Hi Steffen,

Steffen Sledz a écrit :
> Steffen Sledz wrote:
>> 'bitbake sgmlspl-native' fails in dev-branch (with last commit
>> b696acdd7296726efce684e3434f6a6445ddd992) with this exception:
>>
>> ERROR: Error in executing:
>> /home/DRESEARCH/sledz/work/openembedded/recipes/sgmlspl/sgmlspl-native_1.03ii.bb
>> ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'
>>
>> For details see attached log. Could this be a linux vs. linux-gnu
>> related problem?
> 
> I've done some tests and the build was definitly broken by
> 
>  commit d685ab28a425740b4d6c98abb1423d7904240724
>  Author: Khem Raj <raj.khem@gmail.com>
>  Date:   Wed Oct 7 12:39:04 2009 -0700
> 
>     insane.bbclass: Use linux-gnu for TARGET_OS
> 
>     * Add linux-uclibcspe

same thing here with
ERROR: Error in executing: 
/home/ebenard/OMAP/openembedded/recipes/openssl/openssl-native_0.9.8j.bb
ERROR: Exception:<type 'exceptions.KeyError'> Message:'linux'

reverting d685ab28a425740b4d6c98abb1423d7904240724 solves the problem.

Eric


