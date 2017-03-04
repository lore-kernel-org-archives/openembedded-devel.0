Return-Path: <gary@mlbassoc.com>
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by mail.openembedded.org (Postfix) with ESMTP id 8A43F77803
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  4 Mar 2017 12:28:55 +0000 (UTC)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id D196068A01C; Sat,  4 Mar 2017 12:28:54 +0000 (GMT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	loki.analogue-micro-ltd.com
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 92E2F68A019;
	Sat,  4 Mar 2017 12:28:50 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 45D9767400D4;
	Sat,  4 Mar 2017 13:28:50 +0100 (CET)
From: Gary Thomas <gary@mlbassoc.com>
To: openembedded-devel@lists.openembedded.org
References: <1488363425-824-1-git-send-email-yann.peron@optimatic.fr>
	<20170304115436.GD3025@jama>
Message-ID: <41d7f160-1178-ed2a-d60e-7232adde20db@mlbassoc.com>
Date: Sat, 4 Mar 2017 13:28:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170304115436.GD3025@jama>
Subject: Re: [meta-qt5][PATCH] Ajout de qtSerialBus dans la toolchain
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
X-List-Received-Date: Sat, 04 Mar 2017 12:28:56 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-03-04 12:54, Martin Jansa wrote:
> On Wed, Mar 01, 2017 at 11:17:05AM +0100, Yann PERON wrote:
>> ---
>
> Please use English.

That's only part of what's off/missing here:
   * No Signed-off-by
   * No explanation of the change
   * Improper subject [protocol]

>
>>  recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
>> index 1521dbf..2735135 100755
>> --- a/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
>> +++ b/recipes-qt/packagegroups/packagegroup-qt5-toolchain-target.bb
>> @@ -83,6 +83,8 @@ RDEPENDS_${PN} += " \
>>      ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'qtsensors-qmlplugins', '', d)} \
>>      qtserialport-dev \
>>      qtserialport-mkspecs \
>> +    qtserialbus-dev \
>> +    qtserialbus-mkspecs \
>>      qtsvg-dev \
>>      qtsvg-mkspecs \
>>      qtsvg-plugins \
>> --
>> 2.1.4

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

