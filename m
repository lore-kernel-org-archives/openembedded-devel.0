Return-Path: <mike.looijmans@topic.nl>
Received: from smtp05.mail.online.nl (smtp05.mail.online.nl [194.134.25.75])
	by mail.openembedded.org (Postfix) with ESMTP id 6F12676104
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Sep 2015 17:25:37 +0000 (UTC)
Received: from [192.168.1.5] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp05.mail.online.nl (Postfix) with ESMTP id B3F8220009B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Sep 2015 19:25:36 +0200 (CEST)
Message-ID: <55EDC890.2060408@topic.nl>
Date: Mon, 07 Sep 2015 19:25:36 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <55ED5556.2020904@topic.nl> <55ED8405.6050709@linux.intel.com>
	<20150907150906.GA2457@jama>
In-Reply-To: <20150907150906.GA2457@jama>
Subject: Re: Where is libunique?
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
X-List-Received-Date: Mon, 07 Sep 2015 17:25:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 07-09-15 17:09, Martin Jansa wrote:
> On Mon, Sep 07, 2015 at 03:33:09PM +0300, Alexander Kanavin wrote:
>> On 09/07/2015 12:13 PM, Mike Looijmans wrote:
>>> Current meta-openembedded master fails to build with errors like this:
>>>
>>> ERROR: Nothing PROVIDES 'libunique' (but
>>> .../meta-oe/meta-gnome/recipes-gnome/gnome-disk-utility/gnome-disk-utility_2.32.0.bb
>>> DEPENDS on or otherwise requires it).
>>>
>>> Searching for 'unique' in meta-openembedded and openembedded-core
>>> reveiled nothing that would provide it, there's no recipe with 'unique'
>>> in its name, nor any recipe that mentions the word 'unique' provides it,
>>> even though I found various recipes that DEPEND on it.
>>>
>>> Where is libunique?
>>
>> You should check not just the current state of master branches of
>> various layers, but also their commit history.

Oh sure, make it my fault.
FYI, I did look in the log, and I didn't find anything about libunique 
in the meta-openembedded repo. It somehow never occured to me to go look 
for it in other repos too.

>> libunique was just removed from oe-core and a patch was sent to add it
>> to meta-oe. There is no way to keep the removal/addition perfectly in
>> sync because the two layers are kept in separate repos and have
>> different maintainers.
>
> This case can be prevented by adding it to meta-oe before it's removed
> from oe-core (just like when someone is migrating recipes from meta-oe
> to oe-core, they are first added to oe-core and then removed from
> meta-oe).

I was going to suggest that too.

Maybe this would make a good entry for the maintainers handbook?


-- 
Mike Looijmans

