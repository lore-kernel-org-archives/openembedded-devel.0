Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1QyLz3-0007ra-SU
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Aug 2011 12:55:57 +0200
Received: by bkbzu17 with SMTP id zu17so4862334bkb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Aug 2011 03:51:04 -0700 (PDT)
Received: by 10.204.135.2 with SMTP id l2mr2759281bkt.124.1314701464523;
	Tue, 30 Aug 2011 03:51:04 -0700 (PDT)
Received: from fensuse.internal.dresearch-fe.de (pd95cb174.dip0.t-ipconnect.de
	[217.92.177.116])
	by mx.google.com with ESMTPS id z6sm1472652bks.57.2011.08.30.03.51.01
	(version=SSLv3 cipher=OTHER); Tue, 30 Aug 2011 03:51:02 -0700 (PDT)
Message-ID: <4E5CC094.2020500@dresearch-fe.de>
Date: Tue, 30 Aug 2011 12:51:00 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:6.0) Gecko/20110812 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E4E536D.7010103@dresearch-fe.de> <4E4E738C.70109@dresearch-fe.de>
	<4E5356B2.3060908@dresearch-fe.de> <4E53583A.3030405@gmx.net>
	<4E535B83.9080508@dresearch-fe.de>
	<CAFu+nvEh9tUGzQM1PFo1ErtOq+a+0yg94pZBO6Ohr92GNZoKBg@mail.gmail.com>
	<1314199372.21496.12.camel@jjg-linux>
	<4E562AFF.7090004@dresearch-fe.de>
	<4E56579C.7080207@dresearch-fe.de>
In-Reply-To: <4E56579C.7080207@dresearch-fe.de>
X-Enigmail-Version: 1.3.1
Cc: Robert Schuster <robert.schuster@tarent.de>, george.huntingtoniii@gmail.com
Subject: Re: [2011.03-maintenance] do_compile failed for cacao_0.99.3.bb
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
X-List-Received-Date: Tue, 30 Aug 2011 10:55:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25.08.2011 16:09, Steffen Sledz wrote:
> On 25.08.2011 12:59, Steffen Sledz wrote:
>> On 24.08.2011 17:22, Jesse Gilles wrote:
>>> On Tue, 2011-08-23 at 13:16 -0400, George C. Huntington, III wrote:
>>>> I suspect that the problem is happening earlier, classpath isn't building.
>>>>  the javac wrapper eats the return code from a java compile.
>>>
>>> If George is right, then the following patch to the javac wrapper script
>>> may fix the issue.  It fixes building classpath as well as returns the
>>> error code if all javac attempts fail.
>>>
>>> http://patches.openembedded.org/patch/9521/
>>
>> In our case this patch helps.
>>
>> If nobody has objections i will commit this patch to oe-dev master and request a pull to 2011.03-maintenance.
> 
> It would be still better if we can get some Acks from a java maintainer.

No NACKs after another week. So i pushed the patch do oe-dev master.

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


