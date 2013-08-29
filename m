Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 084256BED0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 18:55:21 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so819995pde.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Aug 2013 11:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=yDaiEmOfd9XjtZ+XRqS1c4gvSmq/E4H+pHzwbxHqybc=;
	b=lP0NLmbdCZ9csWRcv0Fxr/MTEVZceiPAe4PgA32SPSyQdntmlHNBDbDR4rp5DL0DMf
	RDB4QGgNngIeXu6pGmrXIFwVnvZVLHYuGDOXYSgyF1ieGky/UVrrUBnh5rbf2vCCWPzP
	spxqscrv207Ltas8CS/7rxwBpZyxEFLX0Rr+pQBjJjnTCg/QvtW2jIUlQlKqKSlVnX6Y
	vcu0Ark7Eji3rYLlqkOtEJxCnBNsYmZ3LaJXCgDI/9MI+a5L+rRM13nwpBZqRTbrVeei
	PsMpWc13zMPN+MOFxugEDS/IzV7HRBkBcaWLiamgLqkNpgi70WlxV7nmGAix3Xr1uKYx
	oFzw==
X-Received: by 10.66.246.229 with SMTP id xz5mr5931764pac.128.1377802521999;
	Thu, 29 Aug 2013 11:55:21 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id sb9sm29957644pbb.0.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 29 Aug 2013 11:55:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <521F96B0.3030209@windriver.com>
Date: Thu, 29 Aug 2013 22:55:12 +0400
Message-Id: <CFB8B97E-3126-42E1-8A32-CB02BFC4DE39@gmail.com>
References: <1377801711-4120-1-git-send-email-elvis.dowson@gmail.com>
	<521F96B0.3030209@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1498)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-core] qemuarma9: Update qemuarma9-standard.scc definition.
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
X-List-Received-Date: Thu, 29 Aug 2013 18:55:21 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Aug 29, 2013, at 10:45 PM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

> On 13-08-29 02:41 PM, Elvis Dowson wrote:
>> This commit
>> - updates the KMACHINE definition to vexpress.
>> - updates the branch to qemuarma9.
>>=20
>> Signed-off-by: Elvis Dowson <elvis.dowson@gmail.com>
>> ---
>>  meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc |    4 =
++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git =
a/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc =
b/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc
>> index c71fe1c..83911ff 100644
>> --- a/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc
>> +++ b/meta/cfg/kernel-cache/bsp/qemuarma9/qemuarma9-standard.scc
>> @@ -1,9 +1,9 @@
>> -define KMACHINE qemuarma9
>> +define KMACHINE vexpress
>=20
> There's no reason to delete the old machine, they are all valid
> and additive. Think of them as aliases. You can have as many
> as you want :)

In the kernel, there is no qemuarma9 machine. The corresponding
kernel machine is vexpress .. I checked the kernel sources, ..=20
correct me if I'm wrong, but I thought the intent of the KMACHINE
variable was to map to the correct machine defined in the kernel.

>=20
>>  define KTYPE standard
>>  define KARCH arm
>>=20
>>  include ktypes/standard/standard.scc
>> -branch arm-versatile-926ejs
>> +branch qemuarma9
>=20
> There's no reason for a custom branch as well. Unless patches are
> being maintained that break compatibility with other boards.
>=20


If we plan on having multiple arm architecture support (A8, A8, A15) to
QEMU, perhaps its better to rename this branch to qemuarm.

Best regards,

Elvis Dowson=

