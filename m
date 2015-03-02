Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id B09F673838
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 22:19:11 +0000 (UTC)
Received: by ykbq9 with SMTP id q9so3095191ykb.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 02 Mar 2015 14:19:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=XFbWyXnufBSpdERlNbCeUmcnvyp3ZD6BP6BCTGuHtuo=;
	b=V0TXFY5EXZL1Wvyk3+TKyFm9s7F8f3lST3IsRPN6utWw/hExhny7y20Rzu84hKz/2+
	UfLgPIGrmZqPp/lJjtw0P+2Z9MuIyCPX3Z59jRz5ZoGgjJwuIOAAiFYp1uOEufVoVd+d
	ktPFV5qjxiiviUHNhaXIQ3bVm/C11ayyRDCkNAtZWxVyb7Vx2NvWYKd4G8ir8L0qr60X
	ajQsvoC6flfnNDSY8GMmvKC6hxM7CddMDdyDIf5imSsRhlBREp4XtzVWJTEvPfWX+mka
	eg286L7IAGqwGwVH+aBivZUciOWnkhpuAxy8e/Isa3yJf342HKrzQWNXaXwAecq1qXI3
	RvfA==
MIME-Version: 1.0
X-Received: by 10.236.44.98 with SMTP id m62mr28260538yhb.136.1425334753147;
	Mon, 02 Mar 2015 14:19:13 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Mon, 2 Mar 2015 14:19:13 -0800 (PST)
In-Reply-To: <54F4DEB8.6010401@balister.org>
References: <54ED1B78.4040101@balister.org> <20150227083113.GF2309@jama>
	<54F0D69F.1090209@balister.org>
	<CAP9ODKojHgfGhYNBRwkCHNdA_1Rp+JuFLSu0tz7D5iUTMjYoKA@mail.gmail.com>
	<54F4CCC6.7070107@balister.org>
	<CAP9ODKr0aNaY6Fk9qXrxd4oLia7fhhtAR3eQSXmoggn9rRJqcw@mail.gmail.com>
	<54F4DEB8.6010401@balister.org>
Date: Mon, 2 Mar 2015 19:19:13 -0300
X-Google-Sender-Auth: yvmN12BFT14x41pq_WMj2EWjAQw
Message-ID: <CAP9ODKqZOg+Uq+W-dubQKuUChm-4hKQrSpi8xM-9dXZxxCo2=A@mail.gmail.com>
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
X-List-Received-Date: Mon, 02 Mar 2015 22:19:14 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 2, 2015 at 7:05 PM, Philip Balister <philip@balister.org> wrote:
> On 03/02/2015 03:56 PM, Otavio Salvador wrote:
>> On Mon, Mar 2, 2015 at 5:49 PM, Philip Balister <philip@balister.org> wrote:
>>> On 02/27/2015 04:37 PM, Otavio Salvador wrote:
>>>> On Fri, Feb 27, 2015 at 5:42 PM, Philip Balister <philip@balister.org> wrote:
>>>>> On 02/27/2015 12:31 AM, Martin Jansa wrote:
>>>>>> On Tue, Feb 24, 2015 at 04:46:48PM -0800, Philip Balister wrote:
>>>>>>> Please pull these three patches into meta-oe/dizzy.
>>>>>>>
>>>>>>> https://github.com/openembedded/meta-oe/pull/19
>>>>>>>
>>>>>>> These lead to a working PyQt4, which will reduce the number of questions
>>>>>>> I get about gnuradio-companion not working on dizzy.
>>>>>>
>>>>>> I'm not sure if we should do upgrades in release branch which should
>>>>>> receive only bug fixes, but I'll let daisy maintainers to decide.
>>>>>
>>>>> Basically, what is in dizzy doesn't work for anyone. To make it work, we
>>>>> need to upgrade to pickup some changes that made pyqt easier to cross
>>>>> compile.
>>>>
>>>> Yes, this is why I support this update however we need to fix the sip
>>>> upgrade path.
>>>>
>>>
>>> What's wrong with the sip update path? Originally, there was only a
>>> recipe for sip-native, this patch replaces the sip-native recipe with
>>> one that works for native and target.
>>
>> Upgrade path. python-sip died no?
>>
>
> Ah yes. python-sip was built from the sip package. The new sip recipe
> handles the building and installation of the python bits.
>
> How do we tell package manages what happened? (Yes I suck at packaging)
>
> In reality, I doubt many people installed python-sip.

Why you don't split it? I think it makes sense to have it splitted.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

