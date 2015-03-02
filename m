Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id 743CF73820
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Mar 2015 22:05:47 +0000 (UTC)
Received: (qmail 27758 invoked by uid 1003); 2 Mar 2015 22:05:49 -0000
Received: from unknown (HELO ?192.168.11.101?)
	(philip@opensdr.com@108.44.84.240)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	2 Mar 2015 22:05:48 -0000
Message-ID: <54F4DEB8.6010401@balister.org>
Date: Mon, 02 Mar 2015 17:05:44 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <54ED1B78.4040101@balister.org>
	<20150227083113.GF2309@jama>	<54F0D69F.1090209@balister.org>	<CAP9ODKojHgfGhYNBRwkCHNdA_1Rp+JuFLSu0tz7D5iUTMjYoKA@mail.gmail.com>	<54F4CCC6.7070107@balister.org>
	<CAP9ODKr0aNaY6Fk9qXrxd4oLia7fhhtAR3eQSXmoggn9rRJqcw@mail.gmail.com>
In-Reply-To: <CAP9ODKr0aNaY6Fk9qXrxd4oLia7fhhtAR3eQSXmoggn9rRJqcw@mail.gmail.com>
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
X-List-Received-Date: Mon, 02 Mar 2015 22:05:52 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 03/02/2015 03:56 PM, Otavio Salvador wrote:
> On Mon, Mar 2, 2015 at 5:49 PM, Philip Balister <philip@balister.org> wrote:
>> On 02/27/2015 04:37 PM, Otavio Salvador wrote:
>>> On Fri, Feb 27, 2015 at 5:42 PM, Philip Balister <philip@balister.org> wrote:
>>>> On 02/27/2015 12:31 AM, Martin Jansa wrote:
>>>>> On Tue, Feb 24, 2015 at 04:46:48PM -0800, Philip Balister wrote:
>>>>>> Please pull these three patches into meta-oe/dizzy.
>>>>>>
>>>>>> https://github.com/openembedded/meta-oe/pull/19
>>>>>>
>>>>>> These lead to a working PyQt4, which will reduce the number of questions
>>>>>> I get about gnuradio-companion not working on dizzy.
>>>>>
>>>>> I'm not sure if we should do upgrades in release branch which should
>>>>> receive only bug fixes, but I'll let daisy maintainers to decide.
>>>>
>>>> Basically, what is in dizzy doesn't work for anyone. To make it work, we
>>>> need to upgrade to pickup some changes that made pyqt easier to cross
>>>> compile.
>>>
>>> Yes, this is why I support this update however we need to fix the sip
>>> upgrade path.
>>>
>>
>> What's wrong with the sip update path? Originally, there was only a
>> recipe for sip-native, this patch replaces the sip-native recipe with
>> one that works for native and target.
> 
> Upgrade path. python-sip died no?
> 

Ah yes. python-sip was built from the sip package. The new sip recipe
handles the building and installation of the python bits.

How do we tell package manages what happened? (Yes I suck at packaging)

In reality, I doubt many people installed python-sip.

Philip

