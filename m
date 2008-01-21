Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JH4he-0003H6-Rh
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Jan 2008 23:01:14 +0100
Received: by ug-out-1314.google.com with SMTP id i24so1016510ugd.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Jan 2008 14:01:17 -0800 (PST)
Received: by 10.66.249.8 with SMTP id w8mr5211142ugh.75.1200952876932;
	Mon, 21 Jan 2008 14:01:16 -0800 (PST)
Received: from ?89.252.38.142? ( [89.252.38.142])
	by mx.google.com with ESMTPS id h1sm7366599ugf.11.2008.01.21.14.01.16
	(version=SSLv3 cipher=OTHER); Mon, 21 Jan 2008 14:01:16 -0800 (PST)
Date: Tue, 22 Jan 2008 00:10:50 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <942022707.20080122001050@gmail.com>
To: Marcin Juszkiewicz <openembedded@haerwu.biz>
In-Reply-To: <200801212053.17632.openembedded@haerwu.biz>
References: <200801211408.31701.openembedded@haerwu.biz>
	<13810087643.20080121191622@gmail.com>
	<200801212053.17632.openembedded@haerwu.biz>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: Bug 2430 -- TrueType fonts handling and solution for it
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Jan 2008 22:01:15 -0000
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 8bit

Hello Marcin,

Monday, January 21, 2008, 9:53:16 PM, you wrote:

> Dnia Monday, 21 of January 2008, Paul Sokolovsky napisa³:
>> Monday, January 21, 2008, 3:08:31 PM, Marcin wrote:

>>   Is such extra level of indirection and multiplexing really required?

> Yes -- it is required. This way we will have it solved once and will not
> have to change it just because XDE or PSDE uses fonts in other way.

  Yes.

>> Or rather, I wish we separated this matter to 2 separate ones:
>>
>> 1. Adopting reusable pattern for solving task of "need to 'register'
>> objects of arbitrary type".
>> 2. See what kind of registration support required for objects of type
>> fonts.

> Feel free to suggest other solution. This one which I summarized was 
> discussed on IRC for quite long time.

>> For 1, I wish we adopted some easy scheme, like, for all packages
>> containing object of type foo, to have in postinstall:
>>
>> [ -x /usr/bin/update-foo ] && /usr/bin/update-foo

> What will be "update-foo" for fonts? Will it be "update-fonts" which Rolf
> and I suggest or will it be "update-fonts-for-opie" 
> + "update-fonts-for-fontconfig" + "update-fonts-for-xde" etc? I have a
> feeling that you try to force us to go second way.

>> Then, for each specific object type, specific package will handle
>> registration

> And thats what our suggestion do. If you install "specific object type"
> (which TrueType/OpenType fonts are) then "specific package" 
> (update-fonts-common + scripts from each system which use TTF) will 
> handle registration of "objects" (fonts) in system.


>> for example among following (but not limiting to) choices:

>> 1. No registration needed at all - no /usr/bin/update-foo, nothing
>> will be done.

> And nothing will see TT/OT font.

  I didn't talk about fonts, I was talking about *generic* scheme
which might be reusable for other (all) kinds of objects and
environments.

>> 2. In simplest case, /usr/bin/update-foo will be a symlink to tool
>> handling registration for specific environment.

> And when user will install other environment then which one will be 
> called?

  That depends on object type.

>> 3. If some objects really need registration with different facilities,
>> multiplex scheme as described can be used.

> If there are scripts only for one environment installed then it is like
> your 2nd point.

  If you think it should be 3rd for fonts, then it must be that way.

> I really do not see a problem where you are trying to find one.

  I'm usually trying to generalize a solution if its worth that IMHO,
and for OE, a rather large system, having best practices of general
solutions is worthy aim IMHO. Still, everything is at right time, so
if you think what I've written above is not relevant to current issue
at hand, let's skip it.

  The described as above font handling is +1 from me.



-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



