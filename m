Return-Path: <jaap.dejong@nedap.com>
Received: from smtp4.nedap.com (smtp4.nedap.com [213.160.213.85])
	by mail.openembedded.org (Postfix) with ESMTP id 2BB6377C17
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Apr 2017 11:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nedap.com; i=@nedap.com; q=dns/txt; s=20161201;
	t=1491476771; x=1523012771;
	h=to:from:subject:message-id:date:mime-version;
	bh=8VOIIhJq9YsTDGJ0ppD5xXy3vv36hmYskp/LGwyniRg=;
	b=WjTFtTXYmz692sph/e1iZSB4QM8Zw9+CbfPbbd2O9u0pIYKtvqn4KIMu
	vs3I5h+hvl7dyaQLweaxmQKiX6Unv1G/6XIIS+aVmb3VEfbIFhhIwJ71E
	ZkTLS69HbcyTPH2RNaa9M4REQlHBtaH5cjbVQ2SrH96E+AHub/6deuurB s=;
Received: from nvc2354.nedap.local (HELO [10.2.16.86]) ([10.2.16.86])
	by smtp4.nedap.com with ESMTP; 06 Apr 2017 13:06:08 +0200
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
From: Jaap de Jong <jaap.dejong@nedap.com>
Message-ID: <0b83cb90-55b2-ae9a-7fa4-710ac669688e@nedap.com>
Date: Thu, 6 Apr 2017 13:06:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] uftp: Add recipe
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
X-List-Received-Date: Thu, 06 Apr 2017 11:06:09 -0000
X-Groupsio-MsgNum: 66146
Content-Type: multipart/mixed; boundary="------------51D109EC6C7CFDE9EEAAD1C4"

--------------51D109EC6C7CFDE9EEAAD1C4
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



--------------51D109EC6C7CFDE9EEAAD1C4
Content-Type: text/plain; charset=UTF-8;
 name="0001-uftp-Add-recipe.patch.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-uftp-Add-recipe.patch.txt"

RnJvbSAxYTAxMWUxZjFjMmNhNjA3NDkwMTgzOTQxMzBhNzg2MGFlN2VkODE2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBKYWFwIGRlIEpvbmcgPGphYXAuZGVqb25nQG5lZGFwLmNvbT4K
RGF0ZTogVGh1LCA2IEFwciAyMDE3IDEyOjE3OjA5ICswMjAwClN1YmplY3Q6IFttZXRhLW5ldHdv
cmtpbmddW1BBVENIXSB1ZnRwOiBBZGQgcmVjaXBlClRvOiBvcGVuZW1iZWRkZWQtZGV2ZWxAbGlz
dHMub3BlbmVtYmVkZGVkLm9yZwoKLS0tCiBtZXRhLW5ldHdvcmtpbmcvcmVjaXBlcy1zdXBwb3J0
L3VmdHAvdWZ0cF80LjkuMy5iYiB8IDE2ICsrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2Vk
LCAxNiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgbWV0YS1uZXR3b3JraW5nL3Jl
Y2lwZXMtc3VwcG9ydC91ZnRwL3VmdHBfNC45LjMuYmIKCmRpZmYgLS1naXQgYS9tZXRhLW5ldHdv
cmtpbmcvcmVjaXBlcy1zdXBwb3J0L3VmdHAvdWZ0cF80LjkuMy5iYiBiL21ldGEtbmV0d29ya2lu
Zy9yZWNpcGVzLXN1cHBvcnQvdWZ0cC91ZnRwXzQuOS4zLmJiCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAuLjExNjZmOWEKLS0tIC9kZXYvbnVsbAorKysgYi9tZXRhLW5ldHdvcmtp
bmcvcmVjaXBlcy1zdXBwb3J0L3VmdHAvdWZ0cF80LjkuMy5iYgpAQCAtMCwwICsxLDE2IEBACitE
RVNDUklQVElPTiA9ICJFbmNyeXB0ZWQgVURQIGJhc2VkIEZUUCB3aXRoIG11bHRpY2FzdCIKK0hP
TUVQQUdFID0gImh0dHBzOi8vc291cmNlZm9yZ2UubmV0L3Byb2plY3RzL3VmdHAtbXVsdGljYXN0
IgorU0VDVElPTiA9ICJsaWJzL25ldHdvcmsiCisKK0xJQ0VOU0UgPSAiR1BMdjMiCitMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFLnR4dDttZDU9ZDMyMjM5YmNiNjczNDYzYWI4NzRl
ODBkNDdmYWU1MDQiCisKK1NSQ19VUkkgPSAiJHtTT1VSQ0VGT1JHRV9NSVJST1J9L3VmdHAtbXVs
dGljYXN0L3NvdXJjZS10YXIvdWZ0cC0ke1BWfS50YXIuZ3oiCitTUkNfVVJJW21kNXN1bV0gPSAi
MjMxZDZiYTc4MjBkODlhNzEyZmU3ZDcyN2FiMGY4ZTYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAi
OWU5MjE1YWYwMzE1MjU3YzZjYzRmNDBmYmM2MTYxMDU3ZTg2MWJlMWZmZjEwYTM4YTU1NjRmNjk5
ZTk5Yzc4ZiIKKworREVQRU5EUyA9ICJvcGVuc3NsIgorCitkb19pbnN0YWxsICgpIHsKKwlvZV9y
dW5tYWtlIGluc3RhbGwgREVTVERJUj0ke0R9Cit9Ci0tIAoyLjcuNAoK

--------------51D109EC6C7CFDE9EEAAD1C4--
