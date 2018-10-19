Return-Path: <ftoth@telfort.nl>
Received: from radex-web.radex.nl (smtp.radex.nl [178.250.146.7])
	by mail.openembedded.org (Postfix) with ESMTP id A69E0605BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Oct 2018 08:01:51 +0000 (UTC)
Received: from [192.168.1.22] (cust-178-250-146-69.breedbanddelft.nl
	[178.250.146.69])
	by radex-web.radex.nl (Postfix) with ESMTPS id C2BB524057;
	Fri, 19 Oct 2018 10:01:51 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>
References: <baba8cff-5f3f-b6a4-efcd-377a43ba8096@telfort.nl>
	<CAMKF1soxg8+rL-L4KLAZQy4cVoFZR=jz0uGrprJJCGBk05_Oag@mail.gmail.com>
From: Ferry Toth <ftoth@telfort.nl>
Message-ID: <fd4a2a9d-758c-7d8f-a118-b39a7884dc0f@telfort.nl>
Date: Fri, 19 Oct 2018 10:01:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1soxg8+rL-L4KLAZQy4cVoFZR=jz0uGrprJJCGBk05_Oag@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: libgpiod2 incorrectly depends on python3-core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 19 Oct 2018 08:01:52 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

Op 18-10-18 om 17:37 schreef Khem Raj:
> Hi ferry
>
> On Thu, Oct 18, 2018 at 6:33 AM Ferry Toth <ftoth@telfort.nl> wrote:
>> On master (to be 2.6): In recipe libgpiod_1.1.1 when enabling python3
>> bindings the generated libgpiod2 package depends on python3-core. The
>> result is when needing only libgpiod-tools in initramfs the whole of
>> python3 is pulled in.
>>
> This is because of the recommendation thats added to for best out of
> box instal experience. You can always override that in your image
> recipe and that will break the rdep chain
>
> BAD_RECOMMENDATIONS += "libgpiod-python"

I am generating deb's and already receive one warning that deb's do not 
support BAD_RECOMMENDATIONS. Would that work?

In the deb control file we have:

Depends: libc6 (>= 2.27), python3-core
Recommends: libgpiod-python, libgpiod-tools
Provides: libgpiod

I believe the depends is wrong as it is libgpiod-python that depends on 
python3-core.

But libgpiod-python control file has only:

Depends: libc6 (>= 2.27), libgpiod2 (>= 1.1.1), libpython3.5m1.0 (>= 3.5.5)

>> I believe this dependency to be incorrect, instead libgpiod-python
>> should depend on python3-core.
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

