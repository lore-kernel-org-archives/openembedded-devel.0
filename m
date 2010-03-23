Received: from exprod5og114.obsmtp.com ([64.18.0.28])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@ge.com>) id 1Nu1fQ-00034n-KT
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 11:49:03 +0100
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob114.postini.com ([64.18.4.12]) with SMTP
	ID DSNKS6ib4WYyP7t4HVln5pvIJOXDdVGtHCFm@postini.com;
	Tue, 23 Mar 2010 03:45:54 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip05.e2k.ad.ge.com with ESMTP; 23 Mar 2010 06:45:52 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 23 Mar 2010 06:45:53 -0400
Message-ID: <4BA89CA5.9040005@ge.com>
Date: Tue, 23 Mar 2010 10:49:09 +0000
From: Martyn Welch <martyn.welch@ge.com>
User-Agent: Thunderbird 2.0.0.24 (X11/20100317)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20100322092415.27540.53806.stgit@ES-J7S4D2J.amer.consind.ge.com>	<20100322093506.27540.52750.stgit@ES-J7S4D2J.amer.consind.ge.com>
	<201003221053.22941.marcin@juszkiewicz.com.pl>
In-Reply-To: <201003221053.22941.marcin@juszkiewicz.com.pl>
X-SA-Exim-Connect-IP: 64.18.0.28
X-SA-Exim-Mail-From: martyn.welch@ge.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 05/12] Add alternatives to patch
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
X-List-Received-Date: Tue, 23 Mar 2010 10:49:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Marcin Juszkiewicz wrote:
> Dnia poniedziałek, 22 marca 2010 o 10:35:06 Martyn Welch napisał(a):
>   
>> This adds an alternatives link for /bin/sh to the bash package. When
>> installed this will make bash overide the busybox provided shell for
>> "/bin/sh". This may or may not be desirable, but including it does allow an
>> image to be provided without busybox.
>>     
>
> update-alternatives is shell script so we can end in shellless system ;(
>
> Regards, 
>   

Hm, hadn't appreciated that.

I'd assumed that this was the same as the update-alternatives used in
Debian, but looking in the relevant recipes directory I now appreciate
that this probably isn't the case. It looks like the "dpkg" version is
perl rather than shell and I assume it doesn't have the same problem
because perl isn't managed though the alternatives system. I suspect
there may be only one provider of perl...

Martyn

-- 
Martyn Welch (Principal Software Engineer)   |   Registered in England and
GE Intelligent Platforms                     |   Wales (3828642) at 100
T +44(0)127322748                            |   Barbirolli Square, Manchester,
E martyn.welch@ge.com                        |   M2 3AB  VAT:GB 927559189



