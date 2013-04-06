Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UOaPS-0007JR-Tt
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Apr 2013 23:12:41 +0200
Received: by mail-oa0-f47.google.com with SMTP id o17so4989490oag.20
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Apr 2013 13:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=S5wlgdBaRzWnl+fiVjK76iAGPfJabhAxjGX1rFM5Pmc=;
	b=eEs7L8oTe3U9j7ECB7tQ1OPCAKjbqKCUn/NsQ0BZGp0iefiAD6gszq6j4cy8ta/7LE
	vtgXIo4JzNo55/9pb5M1yOih2ex7e4tVt2lHFJPRQIjhJp8BzCdHuG7tGQvX5YXlgRCM
	/Wx8qg4OPWxY3vDJ/YMlVpZk8RS8ARu4yM2TGRNFKeXuNYTe3JQWmSNb94tp7Citnc8e
	+Gg7Bq7S4fb+iFRPo8Imb8i5cuHrX4hIN68AH92xk+pX8YRWqtTgQ+AMBII73ZisGOFP
	3qaL5mfgELuDnlBHo6nE9wha5cNZWJ8e+x1ntaMfYPNngcjWaulJcSlWUslHKiZPf5KR
	gKhg==
MIME-Version: 1.0
X-Received: by 10.60.63.73 with SMTP id e9mr11403369oes.87.1365281710323; Sat,
	06 Apr 2013 13:55:10 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Sat, 6 Apr 2013 13:55:10 -0700 (PDT)
In-Reply-To: <7895477.XWUCIH5euc@helios>
References: <cover.1365204818.git.paul.eggleton@linux.intel.com>
	<9e4a915b5a1e871ee28c3b723475d143162a8286.1365204818.git.paul.eggleton@linux.intel.com>
	<CAP9ODKpt1GX0pbHx-=HKsJ9-BkZfhxQiAcJVdBkc4iGhu-bg+g@mail.gmail.com>
	<7895477.XWUCIH5euc@helios>
Date: Sat, 6 Apr 2013 17:55:10 -0300
X-Google-Sender-Auth: BU7iHFPkYN4sFvzbFQISUVrmJAA
Message-ID: <CAP9ODKpGJBC7DFW1YTbaXH0MpkC95T=zfPXnrT07wt3zGs25kA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 4/4] qt4: remove bbappends
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
X-List-Received-Date: Sat, 06 Apr 2013 21:12:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Apr 6, 2013 at 4:28 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Saturday 06 April 2013 10:36:41 Otavio Salvador wrote:
>> On Fri, Apr 5, 2013 at 8:35 PM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > These changes to Qt's configuration need to be applied in distro layers,
>> > not in meta-oe.
>> >
>> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>
>> NACK!
>>
>> Keep PRINC as otherwise revision will go backwards.
>
> Sigh... Oh well I guess Qt 4.8.5 is just around the corner and then we can
> drop this bbappend. When can we drop the packagegroup one though?

We can't; but it does not hurt as I think it won't be removed from
oe-core any time soon ;-)

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


