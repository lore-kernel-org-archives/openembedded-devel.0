Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1OqwQC-0003fG-80
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Sep 2010 01:08:49 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1OqwPc-0004di-Lf from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 16:08:12 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Wed, 1 Sep 2010 16:08:12 -0700
Received: from [172.30.80.207] ([172.30.80.207]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 1 Sep 2010 17:08:11 -0600
Message-ID: <4C7EDCD7.3030300@mentor.com>
Date: Wed, 01 Sep 2010 16:08:07 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283356972-28880-1-git-send-email-noor_ahsan@mentor.com>
	<1283382009.2012.15.camel@saphir>
In-Reply-To: <1283382009.2012.15.camel@saphir>
X-OriginalArrivalTime: 01 Sep 2010 23:08:11.0516 (UTC)
	FILETIME=[8C6BFBC0:01CB4A2A]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] sip-native: Run oe-stylize script on the recipe and modify the recipe accordingly.
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
X-List-Received-Date: Wed, 01 Sep 2010 23:08:49 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Michael 'Mickey' Lauer wrote:
> Thanks for your patch, but here's what I don't like
> (yes, probably oe-stylize is to blame, perhaps someone
> could fix it there)
> 
>> -export BUILD_SYS
>> -export HOST_SYS
>> -export STAGING_LIBDIR
>> -export STAGING_INCDIR
>> -
>>  EXTRA_QMAKEVARS_POST += "DESTDIR=${S} CONFIG=console"
>>  
>>  do_configure_prepend() {
>> -	cat sipgen.sbf | sed s,target,TARGET, | sed s,sources,SOURCES, | sed s,headers,HEADERS, > sipgen.pro
>> +        cat sipgen.sbf | sed s,target,TARGET, | sed s,sources,SOURCES, | sed s,headers,HEADERS, > sipgen.pro
>>  }
>> -
>>  do_stage() {
>> -	install -m 0755 sip ${STAGING_BINDIR_NATIVE}/sip
>> -	cd ${WORKDIR}/sip-${PV} && python configure.py
>> -	install -d ${STAGING_PYDIR}/site-packages
>> -	install -m 0755 sip*.py ${STAGING_PYDIR}/site-packages
>> +        install -m 0755 sip ${STAGING_BINDIR_NATIVE}/sip
>> +        cd ${WORKDIR}/sip-${PV} && python configure.py
>> +        install -d ${STAGING_PYDIR}/site-packages
>> +        install -m 0755 sip*.py ${STAGING_PYDIR}/site-packages
>>  }
>>  
>> -SRC_URI[md5sum] = "597d7ff7edb42a18421c806ffd18a136"
>> -SRC_URI[sha256sum] = "7faaccb6f17296399051bd076a7f41e0f6d95a28eda3e30468f1bd7cf45898e1"
>> +export BUILD_SYS
>> +export HOST_SYS
>> +export STAGING_LIBDIR
>> +export STAGING_INCDIR
>> +
>> +DEFAULT_PREFERENCE = "-1"
> 
> I like to keep a mental model of recipes being somewhat executed in a
> top-down manner; in the model, exported variable assignments do in fact
> affect all of tasks, so I think they should be kept next to the
> non-exported assignments.

Yes, that does sound right, fixing oe-stylize now...

-- 
Tom Rini
Mentor Graphics Corporation


