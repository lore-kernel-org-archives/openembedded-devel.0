Received: from out5.smtp.messagingengine.com ([66.111.4.29])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OKNew-0002P6-Fc
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 05:33:28 +0200
Received: from compute1.internal (compute1.internal [10.202.2.41])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 0E0F8F8F37
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jun 2010 23:29:08 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute1.internal (MEProxy); Thu, 03 Jun 2010 23:29:08 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=GpYRO87JdKbaaRf+20hN2idgBi8=;
	b=qXFXCZJwVgk1f7rhAw8JBuZGMcTn9fAIgkkXLvly1pAOiWXVRu9AnFTePvso8W9NQJyWXD4zJyqGqa6+SpOhVrPm9EV0hyqBbty51UZc835xD+zCj8viCsZHMCGJEKKKpkpFteZbVof8CIRYz/GdhtmKnc2x/S5c9B1LuYe9oMw=
X-Sasl-enc: fVCp89PZ9MxIdW0vchY7wM38RIShu6ryEjZieqn8vFEW 1275622147
Received: from [192.168.1.35] (hnvr-4d07a615.pool.mediaWays.net [77.7.166.21])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 493C94BE8B1
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Jun 2010 23:29:07 -0400 (EDT)
Date: Fri, 4 Jun 2010 05:30:37 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1275557631.3916.17.camel@balakrishnan-desktop>
Message-ID: <alpine.LNX.2.00.1006040520300.5274@asterix.crazy-teaparty.dyndns.org>
References: <1275557631.3916.17.camel@balakrishnan-desktop>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.29
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: linux_2.6.34 staging error
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
X-List-Received-Date: Fri, 04 Jun 2010 03:33:28 -0000
X-Groupsio-MsgNum: 19841
Content-Type: MULTIPART/MIXED; BOUNDARY="8323328-109214928-1275622239=:5274"

--8323328-109214928-1275622239=:5274
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Thu, 3 Jun 2010, balakrishnan wrote:

> Hi,
>  I am trying to build linux_2.6.34 kernel for my development board on
> stable/2009 branch. So that I have added below recipe to accomplish this
> stuff. During bitbake I got staging error, can I have solution for
> this?.
>
> NOTE: Running task 396 of 546 (ID:
> 9, /home/balakrishnan/econsystems/projects/openembedded/recipes/linux/linux_2.6.34.bb, do_populate_staging)
> ERROR: function do_stage failed
> ERROR: see log
> in /home/balakrishnan/econsystems/projects/tmp/work/alioth-angstrom-linux-gnueabi/linux-2.6.34-r1/temp/log.do_stage.4058

You could take a look into that logfile.


Or use the attached patch to add linux 2.6.34 to stable/2009, it's working 
here for a pp603e-based machine.  You may have to add the checksums to 
checksums.ini if you don't use the patch for inline checksums.

And for some reasons I had to build u-boot-mkimage-native first.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers

--8323328-109214928-1275622239=:5274
Content-Type: TEXT/PLAIN; charset=US-ASCII; name=0001-linux_2.6.34-new-recipe.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.LNX.2.00.1006040530370.5274@asterix.crazy-teaparty.dyndns.org>
Content-Description: 
Content-Disposition: attachment; filename=0001-linux_2.6.34-new-recipe.patch

RnJvbSBjNzc1OWVjODhmMDM2NDUzMjA0N2IwNWMwNmU0NWQ5YTJiYjJhNjEzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQ0KRnJvbTogVml0dXMgSmVuc2VuIDx2amVuc2VuQGdteC5kZT4NCkRhdGU6
IEZyaSwgNCBKdW4gMjAxMCAwNToxNjowNyArMDIwMA0KU3ViamVjdDogW1NUQUJMRV1bUEFUQ0hd
IGxpbnV4XzIuNi4zNDogbmV3IHJlY2lwZQ0KDQoNClNpZ25lZC1vZmYtYnk6IFZpdHVzIEplbnNl
biA8dmplbnNlbkBnbXguZGU+DQotLS0NCiByZWNpcGVzL2xpbnV4L2xpbnV4XzIuNi4zNC5iYiB8
ICAgMTUgKysrKysrKysrKysrKysrDQogMSBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
LCAwIGRlbGV0aW9ucygtKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCByZWNpcGVzL2xpbnV4L2xpbnV4
XzIuNi4zNC5iYg0KDQpkaWZmIC0tZ2l0IGEvcmVjaXBlcy9saW51eC9saW51eF8yLjYuMzQuYmIg
Yi9yZWNpcGVzL2xpbnV4L2xpbnV4XzIuNi4zNC5iYg0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmlu
ZGV4IDAwMDAwMDAuLjY0ODM1ZDQNCi0tLSAvZGV2L251bGwNCisrKyBiL3JlY2lwZXMvbGludXgv
bGludXhfMi42LjM0LmJiDQpAQCAtMCwwICsxLDE1IEBADQorcmVxdWlyZSBsaW51eC5pbmMNCisN
CitLRVJORUxfUkVMRUFTRSA9ICIyLjYuMzQiDQorS0VSTkVMX1ZFUlNJT04gPSAiJHtLRVJORUxf
UkVMRUFTRX0iDQorUFIgPSAicjAiDQorDQorUyA9ICIke1dPUktESVJ9L2xpbnV4LSR7S0VSTkVM
X1JFTEVBU0V9Ig0KKw0KKyMgTWFyayBhcmNocy9tYWNoaW5lcyB0aGF0IHRoaXMga2VybmVsIHN1
cHBvcnRzDQorREVGQVVMVF9QUkVGRVJFTkNFID0gIi0xIg0KKw0KK1NSQ19VUkkgPSAiJHtLRVJO
RUxPUkdfTUlSUk9SfS9wdWIvbGludXgva2VybmVsL3YyLjYvbGludXgtJHtLRVJORUxfUkVMRUFT
RX0udGFyLmJ6MjtuYW1lPWtlcm5lbCBcDQorCWZpbGU6Ly9kZWZjb25maWciDQorU1JDX1VSSVtr
ZXJuZWwubWQ1c3VtXSA9ICIxMGVlYmNiMDE3OGZiNDU0MGUyMTY1YmZkN2VmYzdhZCINCitTUkNf
VVJJW2tlcm5lbC5zaGEyNTZzdW1dID0gImZhMzk1ZmVjN2RlNjMzZGYxY2I4NWI2MjQ4YjhmMzVh
Zjk4MzgwZWQxMjhhOGJjNDY1ZmI0OGJjNGQyNTI2MzMiDQotLSANCjEuNi40LjQNCg0K

--8323328-109214928-1275622239=:5274--
