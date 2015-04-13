Return-Path: <oosaprogrammer@gmail.com>
Received: from mail-vn0-f46.google.com (mail-vn0-f46.google.com
	[209.85.216.46])
	by mail.openembedded.org (Postfix) with ESMTP id 21DB373D5B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 12:19:46 +0000 (UTC)
Received: by vnbf62 with SMTP id f62so19007401vnb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Apr 2015 05:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=Bm9TSRB1LaGU4LFrl7O52ITRLOapFEd+zZLBupO7It8=;
	b=a+RgKMxWqMiIA/rDZ1rw8iZyE0EPIsua8ezjyAWFCPQw8WBXWLctZg0wJ7OimjnHIi
	hTav+d1KWk/VkPbQWDEfio9URYuGP6TEfcMRnydanfaChh6uQx2jiHWoT1BjVtIdbOEA
	QNLwZsf0RkY6M1sZDLaPepv6Rrjh2fgaYnlsSME4FDfzq008wMSt2jwEoPOnl3oIEEcW
	UGZksm86IEiqqK7IvSILLF/mJll3LthrMcgE+tVLh5wmf8wTV2hiRRnxoHl33p3KK9I/
	Ird9Ifcs/cxEin5HJq5Ggda6mE2I8jNSbH2KVnlNrF2lOTd0I0HXTYRA4zMGPiB2QhKs
	R+oA==
MIME-Version: 1.0
X-Received: by 10.60.101.195 with SMTP id fi3mr11915119oeb.65.1428927588040;
	Mon, 13 Apr 2015 05:19:48 -0700 (PDT)
Received: by 10.202.194.136 with HTTP; Mon, 13 Apr 2015 05:19:48 -0700 (PDT)
Date: Mon, 13 Apr 2015 21:19:48 +0900
Message-ID: <CALYKT1jWL5vS86EVq4v2gH0qU3rVeM=2FEd+tReBu1-Vejw3ug@mail.gmail.com>
From: "Joh Journeyer J." <oosaprogrammer@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [eglibc][iconv] How can I convert a text byte stream from UTF-8 to EUC-KR?
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
X-List-Received-Date: Mon, 13 Apr 2015 12:19:49 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I need to be able to convert a text byte stream from UTF-8 format to
EUC-KR format.

I know I can do this with iconv().

So I tested as shown below :

------------------------------------------------
#include <iconv.h>

void some_func(void) {
  iconv_t it;
  it = iconv_open("UTF-8", "EUC-KR");
}
------------------------------------------------

The result was :

iconv_open returned -1
errno 22

I believe my yocto uses eglibc.

How am I supposed to do to make my eglibc work as expected?


I work with qualcomm modem SW. And the yocto I use is a part of it.
# cat /etc/issue
OpenEmbedded Linux \n \l
# cat /etc/version
LNX.LE.0.0-49022-9x40


Thank you very much in advance!
----------------------------------------
Journeyer J. Joh
o o s a p r o g r a m m e r
a t
g m a i l  d o t  c o m
----------------------------------------

