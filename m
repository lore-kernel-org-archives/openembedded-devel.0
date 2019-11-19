Return-Path: <ross.burton@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id DFEBB7F7C5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Nov 2019 15:10:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Nov 2019 07:10:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,324,1569308400"; d="scan'208";a="215557421"
Received: from unknown (HELO blackadder.local) ([10.252.49.82])
	by fmsmga001.fm.intel.com with ESMTP; 19 Nov 2019 07:10:40 -0800
To: nick83ola <nick83ola@gmail.com>
References: <20191119121609.19869-1-nick83ola@gmail.com>
	<1d110b29-23c2-12ea-68cb-32f465be8be9@intel.com>
	<CABPh3UORbPCPd55aGFBO2WwfN0gGdaZHZk2Ei1jPu+PqUyV-UA@mail.gmail.com>
	<CABPh3UMNoSXmW1FFtvM_j=w1L5Pq7==qg-jfgCAAKyPcsasGVg@mail.gmail.com>
	<0ce7b7c9-2965-1587-0530-acbb9f57fe92@intel.com>
	<CABPh3UPrjNZuQ1JWr3j12V+bv-cfnbU--dnTuFaoqe_S8r55jA@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <68362b3f-aaa8-6a62-bd92-9e8cd299419d@intel.com>
Date: Tue, 19 Nov 2019 15:10:39 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CABPh3UPrjNZuQ1JWr3j12V+bv-cfnbU--dnTuFaoqe_S8r55jA@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH] python3-importlib-metadata: fix class-target overriding default dependencies
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
X-List-Received-Date: Tue, 19 Nov 2019 15:10:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 19/11/2019 14:42, nick83ola wrote:
> Hi Ross,
> 
> thanks for your response.
> 
> So do you suggest to modify in python3_3.7.5.bb <http://python3_3.7.5.bb>:
> 
>      # First set RPROVIDES for -native case
>      # Hardcoded since it cant be python3-native-foo, should be 
> python3-foo-native
>      pn = 'python3'
>      rprovides = d.getVar('RPROVIDES').split()
>      rprovides.append(pn + '-misc-native')
> 
>      for key in python_manifest:
>          pypackage = pn + '-' + key + '-native'
>          if pypackage not in rprovides:
>                rprovides.append(pypackage)
> 
>          d.setVar('RPROVIDES_class-native', ' '.join(rprovides))
> 
> 
> (Or to add an RPROVIDES ayt the end -> is more explicit mabe? this 
> function is getting rprovides = d.getVar('RPROVIDES').split() )
> 
> This change I imagine needs to be done also for python2?

rprovides.append(pn + '-misc-native') seems like the easiest fix for 
now.  Yes, Py2 probably has the same problem.

Ross

