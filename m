Received: from exprod5og114.obsmtp.com ([64.18.0.28])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nr7ku-0006j6-TR
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Mar 2010 11:42:45 +0100
Received: from source ([12.43.191.1]) (using TLSv1) by
	exprod5ob114.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS54ObASg4Umb9TraRUL3EFmC0SBvvr6N@postini.com;
	Mon, 15 Mar 2010 03:39:41 PDT
Received: from unknown (HELO cinmlip01.e2k.ad.ge.com) ([3.159.213.48])
	by Alpmlip07.e2k.ad.ge.com with ESMTP; 15 Mar 2010 06:39:39 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by cinmlip01.e2k.ad.ge.com with ESMTP; 15 Mar 2010 06:39:39 -0400
Message-ID: <4B9E0F2A.4000503@ge.com>
Date: Mon, 15 Mar 2010 10:42:50 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B9E0843.30005@dresearch.de> <4B9E09C8.2060903@ge.com>
	<4B9E0A1B.3070606@dresearch.de>
In-Reply-To: <4B9E0A1B.3070606@dresearch.de>
X-SA-Exim-Connect-IP: 64.18.0.28
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: SRC_URI fetching problem
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
X-List-Received-Date: Mon, 15 Mar 2010 10:42:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Steffen Sledz wrote:
> Martyn Welch wrote:
>   
>> Steffen Sledz wrote:
>>     
>>> I work at a recipe for rsyslog (http://www.rsyslog.com) and hit a
>>> problem with the wget fetcher.
>>>
>>> The download uri for rsyslog-5.4.0.tar.gz does not contain the archive
>>> name itself but is http://www.rsyslog.com/Downloads-req-getit-lid-197.phtml.
>>>
>>> If i set
>>>
>>> SRC_URI = "http://www.rsyslog.com/Downloads-req-getit-lid-197.phtml"
>>> SRC_URI[archive.md5sum] = "291882229d50496f42bd63174076dd37"
>>> SRC_URI[archive.sha256sum] = "d9cd21d2fcd45fcae65eb0a51927c40315cca02afdc62478abd950febfcf7228"
>>>       
>> At a guess you need to add ";name=archive" to the end of your SRC_URI.
>>     
>
> Nope, same behaviour. :(
>
> BTW: The ";name=" option is not documented in the user manual at
> <http://docs.openembedded.org/usermanual/usermanual.html>.
>   

Neither is the relatively new mechanism for incuding the md5sum and
sha256sum in the recipe. Unless you add the "name" parameter (or the
md5sum and sha256sum for that SRC_URI happens to already be in
checksum.ini) you will probably see another failure when it attempts to
validate the archive it has been downloaded. Either way, I think Thomas'
suggestion may be right.

Martyn

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



