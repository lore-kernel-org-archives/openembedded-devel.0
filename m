Return-Path: <dv@vollmann.ch>
Received: from p-smtp-as-02.sunrise.ch (smtp.sunrise.ch [212.35.39.69])
	by mail.openembedded.org (Postfix) with ESMTP id AAE6760D2D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Jan 2014 10:57:03 +0000 (UTC)
Received: from [192.168.26.4] (212-98-43-140.static.adslpremium.ch
	[212.98.43.140])
	by p-smtp-as-02.sunrise.ch (8.14.4/8.14.4) with ESMTP id s06Aux7L027363;
	Mon, 6 Jan 2014 11:57:00 +0100
Message-ID: <52CA8BFC.1000002@vollmann.ch>
Date: Mon, 06 Jan 2014 11:57:00 +0100
From: Detlef Vollmann <dv@vollmann.ch>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <52C9DCCB.5070602@vollmann.ch> <2452646.bnugQMsZpK@helios>
In-Reply-To: <2452646.bnugQMsZpK@helios>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: ASSUME_PROVIDED += sqlite3-native doesn't work
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
X-List-Received-Date: Mon, 06 Jan 2014 10:57:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/06/14 10:46, Paul Eggleton wrote:
> Hi Detlef,
>
> On Sunday 05 January 2014 23:29:31 Detlef Vollmann wrote:
>> Specifying "ASSUME_PROVIDED += sqlite3-native" doesn't work,
>> as pseudo-native explicitely requires SQLite headers in
>> ${STAGING_DIR_NATIVE}.
>> Am I missing something or is this a bug?
>
> I don't think we'd consider this a bug. Basically, if you play around with
> ASSUME_PROVIDED and stuff breaks, you're on your own.
I agree that's my problem if my provided version doesn't have
the same functionality as the one built by OE (as e.g. pseudo and
fakeroot).
However, if ASSUME_PROVIDED doesn't work just because a package
that depends on it (here pseudo) hardcodes the location of
sqlite3 to be in the OE staging tree, then that's really annoying.

> In most cases it's safer
> to build our own versions of things rather than relying on them being
> available on the build host, particularly if you want things to continue to
> work on different host distributions.
That's true.  But my case is different: all our developers use the
same host distribution (otherwise a lot of other things will fail anyway).
Building the standard meta-toolchain produces a huge number of
packages, and it's hard to convince our admins that all those
packages really need to go into our local package repo.
So I'm trying to get down to a reasonable number of packages by using
the standard packages provided by the common host distribution.
This is, what ASSUME_PROVIDED is for.
But this is not possible if recipes are written in a way that
defeat the purpose of ASSUME_PROVIDED :-(

   Detlef


