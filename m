Return-Path: <philip@balister.org>
Received: from sanddollar.geekisp.com (sanddollar.geekisp.com
	[216.168.135.167])
	by mail.openembedded.org (Postfix) with SMTP id 266FC755F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Oct 2015 22:09:19 +0000 (UTC)
Received: (qmail 17754 invoked by uid 1003); 27 Oct 2015 22:09:18 -0000
Received: from unknown (HELO ?10.16.32.95?)
	(philip@opensdr.com@207.114.172.147)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	27 Oct 2015 22:09:18 -0000
To: openembedded-devel@lists.openembedded.org
References: <79D6C2B5-2151-4A49-AC04-48342EFD42FD@gmail.com>
	<CAP9ODKox4BAruNKS8cG8EnB+=egF3zJdHC7WZu3jO9OtresREw@mail.gmail.com>
	<39E716D7-E36A-4696-9503-3DBB6B1C94DF@gmail.com>
From: Philip Balister <philip@balister.org>
Message-ID: <562FF60B.405@balister.org>
Date: Tue, 27 Oct 2015 15:09:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <39E716D7-E36A-4696-9503-3DBB6B1C94DF@gmail.com>
Subject: Re: [meta-oe][PATCH] llvm: update 3.5.2 to have a sane ARM JIT for OpenJDK-8
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
X-List-Received-Date: Tue, 27 Oct 2015 22:09:23 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 10/27/2015 01:21 PM, Jens Rehsack wrote:
> 
>> Am 27.10.2015 um 21:15 schrieb Otavio Salvador <otavio.salvador@ossystems.com.br>:
>>
>> On Tue, Oct 27, 2015 at 6:04 PM, Jens Rehsack <rehsack@gmail.com> wrote:
>>>
>>> llvm introduced new JIT technology MCJIT with llvm 3.4 and fixes ARM in 3.5
>>> (see http://llvm.org/releases/3.5.2/docs/ReleaseNotes.html#changes-to-the-arm-backend).
>>>
>>> Ensure JIT is built with llvm
>>>
>>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>>
>> There is a patch to add LLVM 3.7[1]; I think this one can be dropped.
>>
>> 1. http://patchwork.openembedded.org/patch/106281/
> 
> I'v seen this and I guarantee that OpenJDK-8 will fail heavily with llvm3.7 - the guys
> put an end to an antiquated API's with each release, and OpenJDK's zeroshark uses lot's
> of them.

We'll need the 3.7 series llvm to support llvmpipe in newer mesa. The
mesa update will happen after the release and I want to be ready.

As Martin notes, we are setup to support multiple llvm versions and it
looks like we need to.

Philip

> 
> Cheers
> 

