Return-Path: <ml@calgera.com>
X-Greylist: delayed 305 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 14 May 2019 14:11:59 UTC
Received: from t4v1.calgera.eu (t4v1.calgera.eu [80.208.226.141])
	by mail.openembedded.org (Postfix) with ESMTP id F0C667DED6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 14:11:59 +0000 (UTC)
Received: from [10.227.138.157] (unknown [193.136.33.117])
	by t4v1.calgera.eu (Postfix) with ESMTPSA id 7FB12CB4FDF6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 May 2019 15:06:51 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=calgera.com; s=mail;
	t=1557842814; bh=ylSRUPBpbj6t4lTdUOwLtFkmIWMvQxvwI6NywLKFWwU=;
	h=To:From:Subject:Date:From;
	b=JDIMqAz8tkypmHQCy+5Gc437MtmBj5srgGHyE9UemJGI+htFijPC+1FK7/gESN54V
	RR5NomK80sQqAeVIgQhbbBMtiZdHvZI7bw/GdRpmHQZ0z7s1ypbnII0q+GCl4D8CV7
	ZNUl3soLiwrmb+rte/0RducT0zgdHeseEyOwGabxJsEeLEW+P+cmNkqnZnbetE0knd
	Uqh7Tm8R1TCAnKpQZqC1MHCGalwVcHfSbKDNhkr0A2U16pdBJRFQ+ClAmTGrNOPPCP
	VGYjqU2eYUrxv61YwZQU0MgLwxMlxUixr8f1U0CVGgjLxB90/dlDJ2mp3szNF6RzYx
	J2lDft6Ff7Zig==
To: openembedded-devel@lists.openembedded.org
From: Renato Caldas <ml@calgera.com>
Message-ID: <ba83285c-2a1f-b8be-dcb0-b9a3e3574dca@calgera.com>
Date: Tue, 14 May 2019 15:06:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.1
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on t4v1.calgera.eu
Subject: icedtea-7-native stringop-overflow error
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
X-List-Received-Date: Tue, 14 May 2019 14:12:00 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

I'm having trouble building icedtea-7-native on warrior, here's the 
relevant error:

| 
/(...)/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/hotspot/src/share/vm/adlc/dfa.cpp:546:16: 
error: ‘char* strncpy(char*, const char*, size_t)’ specified bound 
depends on the length of the source argument [-Werror=stringop-overflow=]
|          strncpy(shared_pred_loc, shared_pred_var, 
strlen(shared_pred_var));
| ~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

There was a previous attempt at silencing a similar warning in commit 
f83992acbe737a1d8cc87e73c8983b7fa2f64a1b of meta-java, except for the 
format-overflow warning.

I'm not sure how to approach this, whether to just silence the warning 
or try to fix it somehow. Any help would really be appreciated!


BTW I just posted this question at the yocto mailing list, but have 
since realized it was probably the wrong list. Sorry for the repost.


Cheers,
-- 
Renato Caldas
Calgera, Unipessoal Lda.
Email: renato@calgera.com
Tel: +351 967 709 735

