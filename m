Received: from exprod5og112.obsmtp.com ([64.18.0.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martyn.welch@ge.com>) id 1Pi6FS-000180-BP
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 15:21:26 +0100
Received: from source ([4.79.213.129]) (using TLSv1) by
	exprod5ob112.postini.com ([64.18.4.12]) with SMTP
	ID DSNKTUAttz5FwFuSD7xdOGHCHiiMkaaKkaf8@postini.com;
	Wed, 26 Jan 2011 06:20:41 PST
Received: from unknown (HELO cinmlef12.e2k.ad.ge.com) ([3.159.213.59])
	by Alpmlip04.e2k.ad.ge.com with ESMTP; 26 Jan 2011 05:32:59 -0500
Received: from [3.138.54.92] ([3.138.54.92]) by cinmlef12.e2k.ad.ge.com with
	Microsoft SMTPSVC(6.0.3790.4675); Wed, 26 Jan 2011 05:32:58 -0500
Message-ID: <4D3FF859.2050509@ge.com>
Date: Wed, 26 Jan 2011 10:32:57 +0000
From: Martyn Welch <martyn.welch@ge.com>
Organization: GE Intelligent Platforms
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <131E5DFBE7373E4C8D813795A6AA7F08032A16A440@dlee06.ent.ti.com>	<AANLkTinyeFc_8ai783_mu0deYyFUvebhVq4sVgzbCh0v@mail.gmail.com>
	<AANLkTinc6eLwC5ZTu_uO=Ki00x1VQJc6vs_pFwz1f5oX@mail.gmail.com>
In-Reply-To: <AANLkTinc6eLwC5ZTu_uO=Ki00x1VQJc6vs_pFwz1f5oX@mail.gmail.com>
X-Enigmail-Version: 1.1.2
X-OriginalArrivalTime: 26 Jan 2011 10:32:58.0463 (UTC)
	FILETIME=[66760EF0:01CBBD44]
Subject: Re: bitbake does not fail when QA issues encountered
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
X-List-Received-Date: Wed, 26 Jan 2011 14:21:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25/01/11 21:36, Khem Raj wrote:
> On Tue, Jan 25, 2011 at 12:58 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2011/1/25 Maupin, Chase <chase.maupin@ti.com>:
>>> All,
>>>
>>> I have noticed that when building packages such as perl that while my build will report success and no errors, the return status from the bitbake command was "1".  I was able to produce this by doing:
>>>
>>> MACHINE=am37x-evm bitbake perl
>>>
>>> After bitbake completed I saw:
>>>
>>> NOTE: Tasks Summary: Attempted 851 tasks of which 0 didn't need to be rerun and 0 failed.
>>>
>>> but checking $? yields a return status of "1".
>>>
>>> I looked into the log and noticed a lot of messages like:
>>>
>>> ERROR: QA Issue with db: package db contains bad RPATH
>>>
>>> My understanding is that recent fixes to libtool 2.4 prevent these errors but I am using an older version of Angstrom which pins to libtool 2.2.  I also have found this issue with the Arago distribution which likewise uses libtool 2.2.
>>>
>>> So my question here is whether bitbake should be failing when it encounters these QA issues with a bad RPATH and exiting?
>>>
>>> If not then should the return status be "1"?  This causes issues when using a script that issues builds and then checks the return status for success or failure.  If the QA issues are deemed acceptable (or should be warnings) then I would expect the return status to not indicate a failure.
>>>
>>> I have attached a log of my build for reference
>>>
>>> As another interesting side note which I don't know is related or not, when building Arago with bitbake 1.10.2 the return status is "1".  When building the same Arago metadata with bitbake 1.8.19 the return status is "0".  What is strange here is that since Arago uses a slightly older version of the OE metadata it is not seeing the RPATH errors reported above (the check isn't in the insane.bbclass for Arago yet).  So for some reason bitbake 1.8.19 says everything went fine and bitbake 1.10.2 reports a status of "1" even though there is no reported error.  I'm not sure if this is related to the above in any way or if this is a separate issue.
>>>
>>> Sincerely,
>>> Chase Maupin
>>>
>>
>> I've seen this on other places as well.
>> I'd say if a package has a QA issue the build of that package should
>> fail, because the resulting output is defnitely not OK.
>>
> 
> yes it should fail. However some may raise questions "it used to build
> and not it doesnt"
> so someone has to fix the problems quickly
> 

...and if it is considered a failure and returns 1, the summary shouldn't be
reporting "0 failed", or at least there should be something reported at the
end of the build to state that the build has been deemed a failure for those
not running in a script and who don't read through the entire log of the build!

Martyn

>> Frans
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Martyn Welch (Principal Software Engineer) | Registered in England and
GE Intelligent Platforms                   | Wales (3828642) at 100
T +44(0)127322748                          | Barbirolli Square, Manchester,
E martyn.welch@ge.com                      | M2 3AB  VAT:GB 927559189


