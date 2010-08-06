Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OhMwg-0000Zt-2r
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Aug 2010 15:26:47 +0200
Received: by fxm12 with SMTP id 12so4013920fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 06:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=BWCxfs4zRjjRDdaXMbR7LM6k/Jydoanwr+h1eu9sJWw=;
	b=l26RTCvLlbwrHJlY/tBE45+YFqwt06Z2FyzZXffeMN913e4ffaI9sAEIDRMIPfQOhV
	GKb0xICrJ/+QMp4fcbUSCoKBqr4U2F6itsskCoi7rrGd3wx7zM4nDY+gg5YMBq49drZ8
	JwSflQm8sTszBEn/CERB16YsuKvhUiCMWn7eY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=cG2I1hy/N6OEQPFbStd4Pe9EXseEFBeJl2nF+82tRvnvnGMmAxb9Lzc0JZT9MsXG67
	P3jAXTm1P6ABBej5vws1ELZEDWr5hOxQubXAwKAcgpX5xCT/jihWsJkyvbPdS+DMTiUX
	bgMb3RZ5ZY333sfnXR5+IuYwtTcpyRHUe4W1o=
MIME-Version: 1.0
Received: by 10.223.117.17 with SMTP id o17mr12856271faq.54.1281101196821; 
	Fri, 06 Aug 2010 06:26:36 -0700 (PDT)
Received: by 10.223.164.79 with HTTP; Fri, 6 Aug 2010 06:26:36 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.00.1007270937190.16525@linux.fjfi.cvut.cz>
References: <20100727010733.1B6BB46773@linux.fjfi.cvut.cz>
	<20100727071827.GA3397@rhein.zuhause.netz>
	<alpine.LRH.2.00.1007270937190.16525@linux.fjfi.cvut.cz>
Date: Fri, 6 Aug 2010 15:26:36 +0200
Message-ID: <AANLkTik=kc6yux=p=vrW0i=CyrtZW5dZuN-u-+DZFOOJ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
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
X-List-Received-Date: Fri, 06 Aug 2010 13:26:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 27, 2010 at 9:43 AM, David Kozub <zub@linux.fjfi.cvut.cz> wrote:
> On Tue, 27 Jul 2010, Henning Heinold wrote:
>
>> Eduardo Lima sends in patches for cmake 2.8 too. So please coordinate with
>> him.
>> I would like to see a fine recipe with which uses the latest features
>> available in OE like BBCLASSEXTENDED and so on.
>
> I missed it. It even seems he's been working on webkit-efl too. I'll try to
> contact him.
>
> As for the cmake - I tried and failed. My problem is:
>
> * cmake is built using cmake-native, and it uses inherit cmake
>
> * I can't have inherit cmake in the native recipe, as it would be a circular
> dependency
>
> * I got stuck on: can I somehow "inherit cmake" only for the non-native
> case?

looks strange, but works:
BBCLASSEXTEND = "native"
IS_NATIVE = "no"
IS_NATIVE_virtclass-native = "yes"
INHERIT += " ${@base_conditional("IS_NATIVE", "no", "autotools cmake",
"autotools", d)}"

looks even better, and still works:
INHERIT_CLASSES = "autotools cmake"
INHERIT_CLASSES_virtclass-native = "autotools"
INHERIT += ${INHERIT_CLASSES}

looks even better, and fails somehow :/:
INHERIT_CLASSES = "cmake"
INHERIT_CLASSES_virtclass-native = ""
inherit autotools ${INHERIT_CLASSES}

looks better, but fails:
INHERIT_CLASSES = "autotools cmake"
INHERIT_CLASSES_virtclass-native = "autotools"
inherit ${INHERIT_CLASSES}
-> ParseError: Could not inherit file classes/autotools cmake.bbclass

Tested only by checking -e output!


