Received: from [209.85.210.200] (helo=mail-yx0-f200.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1MGIBx-0007zq-3O
	for openembedded-devel@lists.openembedded.org;
	Mon, 15 Jun 2009 21:50:05 +0200
Received: by yxe38 with SMTP id 38so2316657yxe.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Jun 2009 12:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XWE1WEyuRcR7hBdr7r8CQEy0zxpVFQHb5TLfib5vnpY=;
	b=BizoxZqVLZU1f0Rl/ybRPkjYOqg8lVWTuTzesLXYW1Tz5SU4FuJeScWy5Zm8HEA5Yw
	rIJTReI9IuGkn0OiKU7qLLM0F6QkxwFpQJUK1ThZkFZGuT3qsWO1Xn+/t34IDEK3+1SV
	sAC31zeynwJS+jXgKV5F6IIAdcIHtqoUzjtO8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=d5fPhpehWqP0Ma9syW1S+rFTs0GQ491Vw7IJbYiMvZKU8mmznOE0Mcipv6xvKeHzuG
	3l5Y7dQu6isvfSIshH01nkQeF4AtFIlQQXWtmA0WVh3u1czer4q4JU5TcbyqI3UzriMo
	rBSjxRxo1Q/UvMbBJUpAGzkRz5eqv3EgnKt98=
MIME-Version: 1.0
Received: by 10.231.11.139 with SMTP id t11mr2632376ibt.25.1245094788028; Mon, 
	15 Jun 2009 12:39:48 -0700 (PDT)
In-Reply-To: <1245088339.29153.39.camel@lenovo.internal.reciva.com>
References: <D661B752-90B3-4974-B31E-2B136D05B47F@mac.com>
	<h1557n$fir$1@ger.gmane.org>
	<A333C385-1DED-40D9-AD9E-08DF830A732E@mac.com>
	<4A3665DF.7040109@balister.org>
	<522EC177-58EA-4408-857C-5A010D5C2A1A@mac.com>
	<c384c5ea0906150932p1d9cf9e9u2f02da4ffe21d27c@mail.gmail.com>
	<A53836B7-5B08-42CA-A09B-EABF97DC52D0@mac.com>
	<1245088339.29153.39.camel@lenovo.internal.reciva.com>
Date: Mon, 15 Jun 2009 21:39:47 +0200
Message-ID: <c384c5ea0906151239vfe2a940n2ea42a4183cf6f38@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Help required to create recipe for FANN library
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
X-List-Received-Date: Mon, 15 Jun 2009 19:50:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jun 15, 2009 at 7:52 PM, Phil Blundell<philb@gnu.org> wrote:
> On Mon, 2009-06-15 at 21:34 +0400, Elvis Dowson wrote:
>> =A0 =A0 =A0 When building the FANN library, I get the following message:
>>
>> NOTE: Multiple libraries (libfann.so.2, libdoublefann.so.2,
>> libfixedfann.so.2, libfloatfann.so.2) found and LEAD_SONAME not defined
>>
>> What is the use of the LEAD_SONAME?
>
> You should probably ignore LEAD_SONAME; this mechanism seemed like a
> good idea at the time but with hindsight it was not such a clever plan.

In an OpenEmbedded world with new variables appearing at a weekly
rate, let's try to clean out those who were a bad idea in hindsight
:-)

If there is consensus on this (and this is reviewed by a few core
people) how about we do some refactoring to clean things up and have
LEAD_SONAME removed?


Regards,
--=20
Leon


