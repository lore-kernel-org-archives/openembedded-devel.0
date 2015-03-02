Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 40B7F7381B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 20:56:10 +0000 (UTC)
Received: by ykp9 with SMTP id 9so14619383ykp.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 12:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=rlx/vUOebnT/KiooxEDBrnVZ7MXzbf4FROJn8wFqR2w=;
	b=bfmWdD0eIb0GvViWBdAreBHO4ImPhbLZzcztPXqzozTBro91d1Ak4HKdeQj+HV3DXu
	UxwKZYxwQ4AIhv70qu8+Q32db0P2fvcoyybs3+pBKVNmMwR2KSQDUNHbnRo7j5Wocvlc
	NUkta2Pgewr7gmieQPWS7jQdK+/0L0UsuIknSJmMpqw95uSca870qLvWox5UqCbOQvon
	sVYBs8Vtl7jAkVi91bxnodRvAmEXLl2PClLLAfHf4a4jhDOs6cH3wFBXZe6ji/0u08xb
	50NIU4BupKE3/d1+byyFLHJg69jbd6BDK0W2rXv5Ke3WBHu6hoTNE7Dr9KSRygx+dz67
	ioMQ==
MIME-Version: 1.0
X-Received: by 10.170.209.85 with SMTP id a82mr28986050ykf.99.1425329771309;
	Mon, 02 Mar 2015 12:56:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Mon, 2 Mar 2015 12:56:11 -0800 (PST)
In-Reply-To: <54F4CCC6.7070107@balister.org>
References: <54ED1B78.4040101@balister.org> <20150227083113.GF2309@jama>
	<54F0D69F.1090209@balister.org>
	<CAP9ODKojHgfGhYNBRwkCHNdA_1Rp+JuFLSu0tz7D5iUTMjYoKA@mail.gmail.com>
	<54F4CCC6.7070107@balister.org>
Date: Mon, 2 Mar 2015 17:56:11 -0300
X-Google-Sender-Auth: rE2Hc4IJjY8e5zJ6QxwXCqOBaxo
Message-ID: <CAP9ODKr0aNaY6Fk9qXrxd4oLia7fhhtAR3eQSXmoggn9rRJqcw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][dizzy]Update PyQt and related recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Mar 2015 20:56:15 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 2, 2015 at 5:49 PM, Philip Balister <philip@balister.org> wrote:
> On 02/27/2015 04:37 PM, Otavio Salvador wrote:
>> On Fri, Feb 27, 2015 at 5:42 PM, Philip Balister <philip@balister.org> wrote:
>>> On 02/27/2015 12:31 AM, Martin Jansa wrote:
>>>> On Tue, Feb 24, 2015 at 04:46:48PM -0800, Philip Balister wrote:
>>>>> Please pull these three patches into meta-oe/dizzy.
>>>>>
>>>>> https://github.com/openembedded/meta-oe/pull/19
>>>>>
>>>>> These lead to a working PyQt4, which will reduce the number of questions
>>>>> I get about gnuradio-companion not working on dizzy.
>>>>
>>>> I'm not sure if we should do upgrades in release branch which should
>>>> receive only bug fixes, but I'll let daisy maintainers to decide.
>>>
>>> Basically, what is in dizzy doesn't work for anyone. To make it work, we
>>> need to upgrade to pickup some changes that made pyqt easier to cross
>>> compile.
>>
>> Yes, this is why I support this update however we need to fix the sip
>> upgrade path.
>>
>
> What's wrong with the sip update path? Originally, there was only a
> recipe for sip-native, this patch replaces the sip-native recipe with
> one that works for native and target.

Upgrade path. python-sip died no?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

