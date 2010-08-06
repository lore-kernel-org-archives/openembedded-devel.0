Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eblima@gmail.com>) id 1OhRmp-0003KF-50
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 20:36:59 +0200
Received: by gxk2 with SMTP id 2so3152946gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 11:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=aX0xWCz4xVimBf7Be4nDk/3DWkjEKcbQLBAZmAd59pI=;
	b=Pwhaz+AhUMqxOVBvcJl5B6AcrIxi85khu9ik9/Nnu1ACvx//lbdSZlEr790eSebPcu
	VUrLoc0bidnLvblSdwIyF5VJAahj5mf1HLvotBdxYH5kNJ9Vj+4Dc907XmPG0NiSyayb
	/ZHpg4+4oRuBX2Dd395z3tXo10QQmFHikF6IM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=JcfI+kBwWCguAbn5DfhXsCmYzsGz40rhPqxy6fR6PLWs3as9j+MybneNgwzB3+TIaq
	nuYxlgPrugFsKbjYbfL2WbfBoHWhLIq227iBHykx+y/IK8dCgWJkjAJ757pQ3y0/1Wfi
	qpUZ0GgZeeB8y5ViG/EJZ7F5jBgreDT2NIeBY=
Received: by 10.100.197.7 with SMTP id u7mr14259780anf.104.1281119803374; Fri, 
	06 Aug 2010 11:36:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.115.72 with HTTP; Fri, 6 Aug 2010 11:36:22 -0700 (PDT)
In-Reply-To: <AANLkTik=kc6yux=p=vrW0i=CyrtZW5dZuN-u-+DZFOOJ@mail.gmail.com>
References: <20100727010733.1B6BB46773@linux.fjfi.cvut.cz> 
	<20100727071827.GA3397@rhein.zuhause.netz>
	<alpine.LRH.2.00.1007270937190.16525@linux.fjfi.cvut.cz> 
	<AANLkTik=kc6yux=p=vrW0i=CyrtZW5dZuN-u-+DZFOOJ@mail.gmail.com>
From: "Eduardo Lima (Etrunko)" <eblima@gmail.com>
Date: Fri, 6 Aug 2010 15:36:22 -0300
Message-ID: <AANLkTim9V7ysLwoGhNUTWHC6RW1DD4sdkJzQsgZpjsRJ@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: eblima@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] cmake-native: add recipe for cmake 2.8.2.
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
X-List-Received-Date: Fri, 06 Aug 2010 18:37:00 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 6, 2010 at 10:26 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Tue, Jul 27, 2010 at 9:43 AM, David Kozub <zub@linux.fjfi.cvut.cz> wrote:
>> On Tue, 27 Jul 2010, Henning Heinold wrote:
>>
>>> Eduardo Lima sends in patches for cmake 2.8 too. So please coordinate with
>>> him.
>>> I would like to see a fine recipe with which uses the latest features
>>> available in OE like BBCLASSEXTENDED and so on.
>>
>> I missed it. It even seems he's been working on webkit-efl too. I'll try to
>> contact him.
>>
>> As for the cmake - I tried and failed. My problem is:
>>
>> * cmake is built using cmake-native, and it uses inherit cmake
>>
>> * I can't have inherit cmake in the native recipe, as it would be a circular
>> dependency
>>
>> * I got stuck on: can I somehow "inherit cmake" only for the non-native
>> case?
>
> looks strange, but works:
> BBCLASSEXTEND = "native"
> IS_NATIVE = "no"
> IS_NATIVE_virtclass-native = "yes"
> INHERIT += " ${@base_conditional("IS_NATIVE", "no", "autotools cmake",
> "autotools", d)}"
>
> looks even better, and still works:
> INHERIT_CLASSES = "autotools cmake"
> INHERIT_CLASSES_virtclass-native = "autotools"
> INHERIT += ${INHERIT_CLASSES}
>
> looks even better, and fails somehow :/:
> INHERIT_CLASSES = "cmake"
> INHERIT_CLASSES_virtclass-native = ""
> inherit autotools ${INHERIT_CLASSES}
>
> looks better, but fails:
> INHERIT_CLASSES = "autotools cmake"
> INHERIT_CLASSES_virtclass-native = "autotools"
> inherit ${INHERIT_CLASSES}
> -> ParseError: Could not inherit file classes/autotools cmake.bbclass
>
> Tested only by checking -e output!
>

Well, maybe that was too much for my restricted OE knowledge. Anyway,
are you sure the non-native build works? In many tests David and I did
together, there was need for many tweaks on the non-native. It worths
taking a look here anyhow.

Best Regards, Etrunko

-- 
Eduardo de Barros Lima
eblima@gmail.com


