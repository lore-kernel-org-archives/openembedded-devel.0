Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1QXDRY-0006Gd-Jb
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jun 2011 16:21:12 +0200
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1QXDOB-0001Uc-0u from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 Jun 2011 07:17:43 -0700
Received: from SVR-ORW-FEM-02.mgc.mentorg.com ([147.34.96.206]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 16 Jun 2011 07:12:54 -0700
Received: from [172.30.80.132] (147.34.91.1) by svr-orw-fem-02.mgc.mentorg.com
	(147.34.96.168) with Microsoft SMTP Server id 14.1.289.1;
	Thu, 16 Jun 2011 07:17:41 -0700
Message-ID: <4DFA1078.7090808@mentor.com>
Date: Thu, 16 Jun 2011 07:17:28 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110424 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1308173139-15748-1-git-send-email-eric@eukrea.com>	<4DF94D6A.8090509@mentor.com>
	<BANLkTinmc_Wp-vFoKuRe_LpFdwmVeU8bnQ@mail.gmail.com>
In-Reply-To: <BANLkTinmc_Wp-vFoKuRe_LpFdwmVeU8bnQ@mail.gmail.com>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 16 Jun 2011 14:12:54.0813 (UTC)
	FILETIME=[7C5804D0:01CC2C2F]
Subject: Re: [PATCH 2011.03] eeze 1.0.0: fix checksums
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
X-List-Received-Date: Thu, 16 Jun 2011 14:21:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 06/15/2011 10:27 PM, Martin Jansa wrote:
> On Thu, Jun 16, 2011 at 2:25 AM, Tom Rini <tom_rini@mentor.com> wrote:
>> On 06/15/2011 02:25 PM, Eric Bénard wrote:
>>> the 1.0.0 archive seems to have been changed on the march 17th
>>> when 1.0.1 was created.
>>> This creates a failure when trying to build from scratch using
>>> Angstrom 2008.1 from the maintenance branch.
>>>
>>> Signed-off-by: Eric Bénard <eric@eukrea.com>
>>> ---
>>>  recipes/efl1/eeze_1.0.0.bb |    4 ++--
>>>  1 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/recipes/efl1/eeze_1.0.0.bb b/recipes/efl1/eeze_1.0.0.bb
>>> index 12d70d9..b050473 100644
>>> --- a/recipes/efl1/eeze_1.0.0.bb
>>> +++ b/recipes/efl1/eeze_1.0.0.bb
>>> @@ -6,5 +6,5 @@ SRC_URI = "\
>>>    ${E_MIRROR}/${SRCNAME}-${PV}.tar.gz \
>>>  "
>>>
>>> -SRC_URI[md5sum] = "31f9b2a8fce56a73c99c1c5d2a449fb6"
>>> -SRC_URI[sha256sum] = "27da2b12f60b3c23cd52d16d601b5ab61734b9038beb3ab40129ac770f048d84"
>>> +SRC_URI[md5sum] = "8fa2aa89ba48f262700a3cf88cb1c777"
>>> +SRC_URI[sha256sum] = "d8ffb1af53c03c5860cd90ae78aa5ae0ce2d027a462509deaca5ee3adacd0cee"
>>
>> Is it possible to check eeze 1.0.0 out of upstream scm?  That way when
>> 1.0.2 comes out (or whatever) we don't run the risk of this going bad,
>> again, and so forth...
> 
> I guess it won't be repeated with each release.. you can cherry-pick
> my commit with better commit message explaining what was changed from
> master (or Eric can send pull request for that, I'm away from my
> workstation and I'm not using 2010.13)
> 
> http://git.openembedded.org/cgit.cgi/openembedded/commit/?id=79d295c31e64e972608d5dde5d57e6250d7ca77c

Eric, can you please re-submit with a cherry-pick of this?  Thanks!

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJN+hBiAAoJEI4NMjfc3nJxNAIH/jSyd28xDTJl23wi8iNIkvea
QLZClHWEhM4GSxDlzLsK+C1rJCwyh21abJGoGQebbRM+1OhdRndZnRjO7b29J7sL
8Nt2QVPQ17vKWcGBBRwUxGPOYMKQosbHzNvKlr4s4PWXdbYXsN+N4tNKO4MuQNxu
D34R+HTgVgcqWzouRqLSfAzFVQ8k0nEQ2GP11lXOLOfeQa2uZFlormRiaq6fqZUP
dYt9LzH0U7d8hVNVNFYyXXnEC3PXXb46u58uk+gbbXt3DGAg2bzhP0kcnSU3pOyG
+8JL/HoBPNJJYunWg9/4Cqus0RchAK0NAz0bkIx64DFB7XHJpcqfg/o37u+CiF4=
=xFa+
-----END PGP SIGNATURE-----


