Received: from mail-pz0-f178.google.com ([209.85.222.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1Nx1UP-0004sa-8m
	for openembedded-devel@lists.openembedded.org;
	Wed, 31 Mar 2010 19:14:02 +0200
Received: by pzk8 with SMTP id 8so352801pzk.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 31 Mar 2010 10:10:44 -0700 (PDT)
Received: by 10.141.100.21 with SMTP id c21mr5220955rvm.41.1270055440179;
	Wed, 31 Mar 2010 10:10:40 -0700 (PDT)
Received: from dhcp-173-37-4-92.cisco.com (nat.ironport.com [63.251.108.100])
	by mx.google.com with ESMTPS id 12sm1713492pwi.11.2010.03.31.10.10.37
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 31 Mar 2010 10:10:39 -0700 (PDT)
Message-Id: <89E495CE-E4FB-4482-92CC-0150E247DB02@sundius.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <houqa6$sei$1@dough.gmane.org>
Mime-Version: 1.0 (Apple Message framework v936)
Date: Wed, 31 Mar 2010 10:10:32 -0700
References: <18e217241003301757i23125ed4g3bb55a795ff5db02@mail.gmail.com>
	<houqa6$sei$1@dough.gmane.org>
X-Mailer: Apple Mail (2.936)
X-SA-Exim-Connect-IP: 209.85.222.178
X-SA-Exim-Mail-From: msundius@sundius.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: native recipes use legacy staging.
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
X-List-Received-Date: Wed, 31 Mar 2010 17:14:02 -0000
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit


On Mar 30, 2010, at 11:32 PM, Koen Kooi wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 31-03-10 02:57, C Michael Sundius wrote:
>> why does the native.bbclass force the use of legacy staging?
>>
>> also how can I override this. I tried go use create my own
>>
>> do_stage() {
>>   :
>> }
>>
>> function in my recipe, but the one in the class was still used.
>>
>> My issue is that my install function does not use make at all, nor  
>> autotools
>>
>> so the do_stage_native() call [from do_stage() ] fails.
>
> Try:
>
> PR = "031110"
>
> BBCLASSEXTEND = "native nativesdk"
>
> SRC_URI = "file:///home/sundism/src/mkimage-tools"
>
> S = ${WORKDIR}/mkimage-tools
>
> do_compile() {
>        :
> }
>
>
> do_install() {
>        install  -m 0755 -d ${D}${bindir}
>        install  -m 0755 ${S}/bin/imgen ${D}${bindir}/imgen
>        install  -m 0755 -d ${D}${datadir}
>        install  -m 0755 -d ${D}${datadir}/LxLoad
>        install  -m 0644 ${S}/share/LxLoad/LxLoad2_cronus.img \
>                ${D}${datadir}/LxLoad/LxLoad2_cronus.img
> }
>
> NATIVE_INSTALL_WORKS = "1"
>
> regards,
>
> Koen
>
>
Koen,

Thanks for your help, that worked perfectly.

Also it seems as though for standard installs, the files that are  
installed are split up into foo, foo-dbg, foo-devel etc. where as with  
a native or a nativesdk you have no control on how much of everthing  
gets installed. Is that so or is there a way to pick and choose what  
gets put into the nativesdk.

Finally, for a native build, I suspect that everything that is  
installed will be packaged up in the packaged staging package. whereas  
for the nativesdk no packaging is done, is that right? is there a way  
to make it package the sdk up in the end (short of running tar/rmp/ 
ipkg yourself).

thanks




