Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	by mail.openembedded.org (Postfix) with ESMTP id B3B2C793B7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Sep 2018 21:41:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 Sep 2018 14:41:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,303,1534834800"; d="scan'208";a="76167345"
Received: from nsankark-mobl2.gar.corp.intel.com (HELO localhost.localdomain)
	([10.249.72.216])
	by orsmga008.jf.intel.com with ESMTP; 25 Sep 2018 14:40:59 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 26 Sep 2018 09:40:56 +1200
Message-ID: <1746555.Qn55kT1oli@localhost.localdomain>
Organization: Intel Corporation
MIME-Version: 1.0
Subject: nodejs-native and OpenSSL
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
X-List-Received-Date: Tue, 25 Sep 2018 21:41:18 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi folks

I've recently been trying to build nodejs-native with oe-core/meta-oe master 
on Ubuntu 14.04, and unfortunately it's failing for me:

--------- snip ---------
/home/paul/poky/poky/build-minnow/tmp/work/x86_64-linux/nodejs-native/8.11.4-r0/node-v8.11.4/out/Release/obj.target/node_lib/src/node_crypto.o: In function `node::crypto::RandomBytesWork(uv_work_s*)':
node_crypto.cc:(.text+0x31): undefined reference to `RAND_poll'
node_crypto.cc:(.text+0x3a): undefined reference to `RAND_status'
node_crypto.cc:(.text+0x52): undefined reference to `RAND_bytes'
node_crypto.cc:(.text+0x89): undefined reference to `ERR_get_error'
/home/paul/poky/poky/build-minnow/tmp/work/x86_64-linux/nodejs-native/8.11.4-r0/node-v8.11.4/out/Release/obj.target/node_lib/src/node_crypto.o: In function `node::crypto::DiffieHellman::GetPrime(v8::FunctionCallbackInfo<v8::Value> const&)::{lambda(dh_st const*)#1}::_FUN(dh_st const*)':
node_crypto.cc:(.text+0x121): undefined reference to `DH_get0_pqg'
/home/paul/poky/poky/build-minnow/tmp/work/x86_64-linux/nodejs-native/8.11.4-r0/node-v8.11.4/out/Release/obj.target/node_lib/src/node_crypto.o: In function `node::crypto::DiffieHellman::GetGenerator(v8::FunctionCallbackInfo<v8::Value> const&)::{lambda(dh_st const*)#1}::_FUN(dh_st const*)':
node_crypto.cc:(.text+0x141): undefined reference to `DH_get0_pqg'
/home/paul/poky/poky/build-minnow/tmp/work/x86_64-linux/nodejs-native/8.11.4-r0/node-v8.11.4/out/Release/obj.target/node_lib/src/node_crypto.o: In function `node::crypto::SecureContext::TicketCompatibilityCallback(ssl_st*, unsigned char*, unsigned char*, evp_cipher_ctx_st*, hmac_ctx_st*, int)':
node_crypto.cc:(.text+0x172): undefined reference to `SSL_get_SSL_CTX'
node_crypto.cc:(.text+0x17c): undefined reference to `SSL_CTX_get_ex_data'
node_crypto.cc:(.text+0x1c1): undefined reference to `EVP_aes_128_cbc'
--------- snip ---------

At first, since I haven't seen reports of this elsewhere I thought maybe it had
something to do with the host OpenSSL version being 1.0, but adding -H to
CFLAGS/CXXFLAGS and -Wl,--trace to LDFLAGS seems to suggest that it's
using both the headers and libraries for OpenSSL from the sysroot as it 
should.

Has anyone else seen this? Any suggestions? (other than perhaps "update 
your host distro and try again")?

Cheers,
Paul


-- 

Paul Eggleton
Intel Open Source Technology Centre



