Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id 034248FFD6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 19:27:42 +0000 (UTC)
Received: by mail-qt1-f172.google.com with SMTP id o12so1183758qtf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Sep 2019 12:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=6DF5kJDqnHxVLJRA5365q9l3yZMojcHPCxJJC4BZXZc=;
	b=iwdhziTo0+rdrNcXyjHyZYWJtYo6A16VbpLjEHDPmOEAi6tqK7BPfhzvIj8kCAFpmK
	GNd2XtlTq0ISP9xo0ZBb7BwjdDmrD6C6/hw7xxJpCkHMUqbDgAr7Tr0jN2oYOoAkICSF
	qad+2WbvMaEyEUCLzBrYFs46yzx886lfU8ejS6slAFwSKaiEvjbuY/zxk1MHM5OrscwY
	GXn06nB+p3CMwO2Wa2K0KVGjGdnVxwi5vcEp7HV8P3QFUH8xVLGdPIf3WuB7vY/6JlNr
	h1d7JnGQ+sqiIiL0tNfBsmSC/fAseYfW65BrP+sLrlGOBV/v10k88hAbaJO5FX3V9uAI
	fkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=6DF5kJDqnHxVLJRA5365q9l3yZMojcHPCxJJC4BZXZc=;
	b=VrzN093uRUjzk2Ld6a+6gsDNRvRiOOMbd/dbpQFIx5h9SUpq3R4HxACqO2WOcu6KGt
	BM/IvBmw/gHJYmRvhEfOXhSFsEG/S+cOtuVtlDCmegI8IhMubf9VOYF0p50ppGgrjRTF
	QuiPsIQl2/yqSbBp/iNNXSl6JZAmg63bbVZn+9TxMf1wERqbVURSTgQn1gN/pcv1kjl8
	QstlZtMelKfUG7dBoz4yEbNIkHr0wbidQpU+RAEjbIm/6b2Jon3tF+JyYUv/qwhrKIc8
	L8WSzB9rSn7Vhlllf2DSXiwtafM7KxzHsc7CLJ+Tm2KXfzaF6ta53XsG6vftw1CLL/4T
	rAMQ==
X-Gm-Message-State: APjAAAWsV3QZuv1kT+x0nl8PdFcnmAZlzorhf9tBsT+2Q2AKFmrtXwX9
	bJpa4HZqQLQqth3YeYU+nw1SUFMT04XJKv/0uHlheWEWKOo=
X-Google-Smtp-Source: APXvYqzC33mhOMl+JoSvmuzNQE/GKuBqOdZTbC0lycZLfTKqxcFFbsFOpwUacYDHmoWeOWIKlAL3luBf0bGrd4zwanM=
X-Received: by 2002:ac8:5306:: with SMTP id t6mr5901159qtn.53.1568834863425;
	Wed, 18 Sep 2019 12:27:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190828073827.8930-1-yuanc.fnst@cn.fujitsu.com>
	<A8B665D90129BB4F9BA49400152BB380ABE5AD16@fmsmsx121.amr.corp.intel.com>
	<90B94BBA23AFC744A826A4F23375C2D1018E28BAE8@G08CNEXMBPEKD01.g08.fujitsu.local>
	<A8B665D90129BB4F9BA49400152BB380ABE5D0EA@fmsmsx121.amr.corp.intel.com>
	<CANx9H-A2LzC7CU1UzMyHFfXDQ+KOcjt+GbOZpsHfQc0ELBRAnA@mail.gmail.com>
	<CANx9H-ChPn4qGNP8h4VjxfAURzJ7VN+624L0Q8x55un7Y4rRqw@mail.gmail.com>
	<A8B665D90129BB4F9BA49400152BB380ABE6A8AE@fmsmsx121.amr.corp.intel.com>
	<A8B665D90129BB4F9BA49400152BB380ABE71DD3@fmsmsx121.amr.corp.intel.com>
In-Reply-To: <A8B665D90129BB4F9BA49400152BB380ABE71DD3@fmsmsx121.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 18 Sep 2019 12:27:17 -0700
Message-ID: <CAMKF1soF_GgV6bjy6Q1jpBE4kYeUxmp0U3jjwBV8Xgau50vRiw@mail.gmail.com>
To: "Koppolu, Chanakya" <chanakya.koppolu@intel.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python] [PATCH] python-pytest: upgrade 3.4.2 -> 5.1.1
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
X-List-Received-Date: Wed, 18 Sep 2019 19:27:43 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yuan

I see that the issue is not fully fixed yet as seen here
https://github.com/openembedded/meta-openembedded/issues/144

Please see if this can be fixed as soon as possible, or we have to
revert these recipes, I will wait for your response

Thanks
-Khem

On Mon, Sep 16, 2019 at 10:30 AM Koppolu, Chanakya
<chanakya.koppolu@intel.com> wrote:
>
> Hello Chao,
>
> Any update on adding the missing module 'importlib_metadata' and testing =
for any more missing modules for the pytest upgrade?
>
> Regards,
> Chanakya
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Koppolu, Chanakya
> Sent: Thursday, September 12, 2019 5:59 PM
> To: Tim Orling <ticotimo@gmail.com>
> Cc: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-python] [PATCH] python-pytest: upgrade 3.4.2 -> 5=
.1.1
>
> Hello Chao,
>
> Looks like there are multiple runtime modules missing. Here is the log wi=
th the latest packages:
>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: root@intel-corei7-64:~# python3 -m pytest /tests/smoke/=
 |& tee smoke_test.log
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: cat smoke_test.log
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: Traceback (most recent call last):
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/runpy.py", line 193, in _run=
_module_as_main
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: "__main__", mod_spec)
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/runpy.py", line 85, in _run_=
code
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: exec(code, run_globals)
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/pytest.py", li=
ne 6, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: from _pytest.assertion import register_assert_rewrite
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/_pytest/assert=
ion/__init__.py", line 6, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: from _pytest.assertion import rewrite
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/_pytest/assert=
ion/rewrite.py", line 24, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: from _pytest.assertion import util
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/_pytest/assert=
ion/util.py", line 5, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: import _pytest._code
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/_pytest/_code/=
__init__.py", line 2, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: from .code import Code  # noqa
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/_pytest/_code/=
code.py", line 18, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: import pluggy
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/pluggy/__init_=
_.py", line 16, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: from .manager import PluginManager, PluginValidationErr=
or
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/pluggy/manager=
.py", line 6, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: import importlib_metadata
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: ModuleNotFoundError: No module named 'importlib_metadat=
a'
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: root@intel-corei7-64:~# Traceback (most recent call las=
t):
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/runpy.py", line 193, in _run=
_module_as_main
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: "__main__", mod_spec)
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/runpy.py", line 85, in _run_=
code
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: exec(code, run_globals)
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/pytest.py", li=
ne 6, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: from _pytest.assertion import register_assert_rewrite
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/_pytest/assert=
ion/__init__.py", line 6, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: from _pytest.assertion import rewrite
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/_pytest/assert=
ion/rewrite.py", line 24, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: from _pytest.assertion import util
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/_pytest/assert=
ion/util.py", line 5, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: import _pytest._code
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/_pytest/_code/=
__init__.py", line 2, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: from .code import Code  # noqa
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/_pytest/_code/=
code.py", line 18, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: import pluggy
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/pluggy/__init_=
_.py", line 16, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: from .manager import PluginManager, PluginValidationErr=
or
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: File "/usr/lib64/python3.7/site-packages/pluggy/manager=
.py", line 6, in <module>
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: import importlib_metadata
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: ModuleNotFoundError: No module named 'importlib_metadat=
a'
> 02:30:39  ERRR2/v3rnE#1        test_rt_smoke.py#_test @hxj7-eced|jfsrtse0=
2/mbt-02a: console: root@intel-corei7-64:~#
> 02:30:39  ERRR0/v3rn   test_rt_smoke.py#_test @hxj7-eced: evaluation erro=
red
>
> I think all missing runtime module should be tested prior to upgrade of p=
ytest version.
>
> Regards,
> Chanakya
>
> From: Tim Orling [mailto:ticotimo@gmail.com]
> Sent: Wednesday, September 11, 2019 7:40 PM
> To: Koppolu, Chanakya <chanakya.koppolu@intel.com>
> Cc: Yuan, Chao <yuanc.fnst@cn.fujitsu.com>; openembedded-devel@lists.open=
embedded.org
> Subject: Re: [oe] [meta-python] [PATCH] python-pytest: upgrade 3.4.2 -> 5=
.1.1
>
> I see new patches on the mailing list. Thank you.
>
> On Wed, Sep 11, 2019 at 7:38 PM Tim Orling <ticotimo@gmail.com<mailto:tic=
otimo@gmail.com>> wrote:
> We are missing ${PYTHON_PN}-atomicwrites recipe in meta-python. Fujitsu, =
please provide recipe for this missing RDEPENDS and runtime test future upg=
rades. You have broken functionality for others with your upgrade.
>
> In the future, please runtime test all your changes to prevent this from =
happening from again. We all depend on these packages working.
>
> On Tue, Sep 10, 2019 at 1:25 PM Koppolu, Chanakya <chanakya.koppolu@intel=
.com<mailto:chanakya.koppolu@intel.com>> wrote:
> Hi Chao,
>
> I tried your new patch and it doesn't fix the issue. I still see the same=
 module('atomicwrites') missing in python modules.
>
> Regards,
> Chanakya
>
> -----Original Message-----
> From: Yuan, Chao [mailto:yuanc.fnst@cn.fujitsu.com<mailto:yuanc.fnst@cn.f=
ujitsu.com>]
> Sent: Tuesday, September 10, 2019 1:55 AM
> To: Koppolu, Chanakya <chanakya.koppolu@intel.com<mailto:chanakya.koppolu=
@intel.com>>; openembedded-devel@lists.openembedded.org<mailto:openembedded=
-devel@lists.openembedded.org>
> Subject: RE: [oe] [meta-python] [PATCH] python-pytest: upgrade 3.4.2 -> 5=
.1.1
>
> Hi Chanakya,
>
> I have sent a patch(based on pytest 5.1.2) for this runtime error, please=
 try it again.
>
> Regards,
> Chao
>
> > -----Original Message-----
> > From: Koppolu, Chanakya
> > <chanakya.koppolu@intel.com<mailto:chanakya.koppolu@intel.com>>
> > Sent: Saturday, September 7, 2019 8:04 AM
> > To: Yuan, Chao/=E8=A2=81 =E8=B6=85
> > <yuanc.fnst@cn.fujitsu.com<mailto:yuanc.fnst@cn.fujitsu.com>>;
> > openembedded-devel@lists.openembedded.org<mailto:openembedded-devel@li
> > sts.openembedded.org>
> > Subject: RE: [oe] [meta-python] [PATCH] python-pytest: upgrade 3.4.2
> > -> 5.1.1
> >
> > Hello,
> >
> > This pytest upgrade patch fails to test missing runtime modules. Our
> > recent Yocto build from upstream found that the pytest fails to
> > execute due to a missing module. Here is the error report:
> >
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: root@intel-corei7-64:~# python3
> > -m pytest /tests/smoke/ |& tee smoke_test.log
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: cat smoke_test.log
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: Traceback (most recent call last=
):
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/runpy.py", line 193, in _run_module_as_main
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: "__main__", mod_spec)
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/runpy.py", line 85, in _run_code
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: exec(code, run_globals)
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/site-packages/pytest.py", line 6, in <module>
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: from _pytest.assertion import
> > register_assert_rewrite
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/site-packages/_pytest/assertion/__init__.py",
> > line 6, in <module>
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: from _pytest.assertion import re=
write
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/site-packages/_pytest/assertion/rewrite.py",
> > line 20, in <module>
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: import atomicwrites
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: ModuleNotFoundError: No module
> > named 'atomicwrites'
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: root@intel-corei7-64:~#
> > Traceback (most recent call last):
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/runpy.py", line 193, in _run_module_as_main
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: "__main__", mod_spec)
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/runpy.py", line 85, in _run_code
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: exec(code, run_globals)
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/site-packages/pytest.py", line 6, in <module>
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: from _pytest.assertion import
> > register_assert_rewrite
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/site-packages/_pytest/assertion/__init__.py",
> > line 6, in <module>
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: from _pytest.assertion import re=
write
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: File
> > "/usr/lib64/python3.7/site-packages/_pytest/assertion/rewrite.py",
> > line 20, in <module>
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: import atomicwrites
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: ModuleNotFoundError: No module
> > named 'atomicwrites'
> > 02:24:14  ERRR2/jtnsE#1        test_rt_smoke.py#_test
> > @hxj7-eced|jfsrtse02/mbt-02a: console: root@intel-corei7-64:~#
> >
> > Please prove a recipe for the missing module.
> >
> > Regards,
> > Chanakya
> >
> > -----Original Message-----
> > From:
> > openembedded-devel-bounces@lists.openembedded.org<mailto:openembedded-
> > devel-bounces@lists.openembedded.org>
> > [mailto:openembedded-devel-bounces@lists.openembedded.org<mailto:opene
> > mbedded-devel-bounces@lists.openembedded.org>] On Behalf Of Yuan Chao
> > Sent: Wednesday, August 28, 2019 12:38 AM
> > To:
> > openembedded-devel@lists.openembedded.org<mailto:openembedded-devel@li
> > sts.openembedded.org>
> > Subject: [oe] [meta-python] [PATCH] python-pytest: upgrade 3.4.2 ->
> > 5.1.1
> >
> > Refresh patch:
> > 0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch
> >
> > Remove patch: pytest_version_fix.patch since this is not used.
> >
> > License update: Copyright year updated to 2019
> >
> > Signed-off-by: Yuan Chao
> > <yuanc.fnst@cn.fujitsu.com<mailto:yuanc.fnst@cn.fujitsu.com>>
> > ---
> >  .../recipes-devtools/python/python-pytest.inc |  8
> > +--  ...he-setup_requires-for-setuptools-scm.patch | 36 +++++++------
> >  .../python-pytest/pytest_version_fix.patch    | 51 -------------------
> >  ...pytest_3.4.2.bb<http://pytest_3.4.2.bb> =3D>
> > python-pytest_5.1.1.bb<http://python-pytest_5.1.1.bb>} |  0
> > ...ytest_3.4.2.bb<http://ytest_3.4.2.bb>
> > =3D> python3-pytest_5.1.1.bb<http://python3-pytest_5.1.1.bb>} |  0
> >  5 files changed, 24 insertions(+), 71 deletions(-)  delete mode
> > 100644
> > meta-python/recipes-devtools/python/python-pytest/pytest_version_fix.p
> > atch  rename
> > meta-python/recipes-devtools/python/{python-pytest_3.4.2.bb<http://pyt
> > hon-pytest_3.4.2.bb> =3D>
> > python-pytest_5.1.1.bb<http://python-pytest_5.1.1.bb>} (100%)  rename
> > meta-python/recipes-devtools/python/{python3-pytest_3.4.2.bb<http://py
> > thon3-pytest_3.4.2.bb> =3D>
> > python3-pytest_5.1.1.bb<http://python3-pytest_5.1.1.bb>} (100%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-pytest.inc
> > b/meta-python/recipes-devtools/python/python-pytest.inc
> > index 4c32dfb04..49ef790f0 100644
> > --- a/meta-python/recipes-devtools/python/python-pytest.inc
> > +++ b/meta-python/recipes-devtools/python/python-pytest.inc
> > @@ -1,13 +1,13 @@
> >  SUMMARY =3D "Simple powerful teting with python"
> >  HOMEPAGE =3D "http://pytest.org"
> >  LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3Dc39b24965f4aef64222cb35de9d47cc4<file:///\\LICENS=
E;md5=3Dc39b24965f4aef64222cb35de9d47cc4>"
> > +LIC_FILES_CHKSUM =3D
> > "file://LICENSE;md5=3D640061b8cee64b308a4d2f9f556c12f2<file:///\\LICENS=
E;md5=3D640061b8cee64b308a4d2f9f556c12f2>"
> >
> > -SRC_URI[md5sum] =3D "1b83a25d45fad893f430fc5031653c56"
> > -SRC_URI[sha256sum] =3D
> > "117bad36c1a787e1a8a659df35de53ba05f9f3398fb9e4ac17e80ad5903eb8c5"
> > +SRC_URI[md5sum] =3D "662313b4f539f5b66d2fb77791458e82"
> > +SRC_URI[sha256sum] =3D
> > "c3d5020755f70c82eceda3feaf556af9a341334414a8eca521a18f463bcead88"
> >
> >  SRC_URI_append =3D "
> > file://0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch=
<file:///\\0001-setup.py-remove-the-setup_requires-for-setuptools-scm.patch=
> \
> > -                   file://pytest_version_fix.patch<file:///\\pytest_ve=
rsion_fix.patch> "
> > +                   "
> >
> >  inherit update-alternatives
> >
> > diff --git
> > a/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remo
> > ve-t he-setup_requires-for-setuptools-scm.patch
> > b/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remo
> > ve-t he-setup_requires-for-setuptools-scm.patch
> > index 06dfcdfc6..c29fb12de 100644
> > ---
> > a/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-remo
> > ve-t he-setup_requires-for-setuptools-scm.patch
> > +++ b/meta-python/recipes-devtools/python/python-pytest/0001-setup.py-
> > +++ re move-the-setup_requires-for-setuptools-scm.patch
> > @@ -1,7 +1,7 @@
> > -From 24a901fd17926e8e05be4ed2e01b0113a2e3a852 Mon Sep 17 00:00:00
> > 2001
> > -From: Derek Straka <derek@asterius.io<mailto:derek@asterius.io>>
> > -Date: Tue, 19 Dec 2017 11:36:39 -0500
> > -Subject: [PATCH] [PATCH 1/1] setup.py: remove the setup_requires for
> > +From ff784f4803ab33f5e3389e40d038d52d1e211843 Mon Sep 17 00:00:00
> > 2001
> > +From: Yuan Chao
> > +<yuanc.fnst@cn.fujitsu.com<mailto:yuanc.fnst@cn.fujitsu.com>>
> > +Date: Wed, 28 Aug 2019 16:12:27 +0900
> > +Subject: [PATCH] [PATCH] setup.py: remove the setup_requires for
> >   setuptools-scm
> >
> >  The setup_requires argument forces the download of the egg file for
> > setuptools-scm @@ -12,21 +12,25 @@ file and in the release tarball it
> > is already correctly created
> >  Upstream-Status: Inappropriate [oe specific]
> >
> >  Signed-off-by: Derek Straka
> > <derek@asterius.io<mailto:derek@asterius.io>>
> > +
> > +Signed-off-by: Yuan Chao
> > +<yuanc.fnst@cn.fujitsu.com<mailto:yuanc.fnst@cn.fujitsu.com>>
> >  ---
> > - setup.py | 1 -
> > - 1 file changed, 1 deletion(-)
> > + setup.py | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >  diff --git a/setup.py b/setup.py
> > -index 3eb38ef..1163202 100644
> > +index adbafb5..75fdd09 100644
> >  --- a/setup.py
> >  +++ b/setup.py
> > -@@ -82,7 +82,6 @@ def main():
> > -         keywords=3D"test unittest",
> > -         cmdclass=3D{'test': PyTest},
> > -         # the following should be enabled for release
> > --        setup_requires=3D['setuptools-scm'],
> > -         python_requires=3D'>=3D2.7, !=3D3.0.*, !=3D3.1.*, !=3D3.2.*, =
!=3D3.3.*',
> > -         install_requires=3Dinstall_requires,
> > -         extras_require=3Dextras_require,
> > +@@ -19,7 +19,7 @@ INSTALL_REQUIRES =3D [  def main():
> > +     setup(
> > +         use_scm_version=3D{"write_to": "src/_pytest/_version.py"},
> > +-        setup_requires=3D["setuptools-scm", "setuptools>=3D40.0"],
> > ++        setup_requires=3D["setuptools>=3D40.0"],
> > +         package_dir=3D{"": "src"},
> > +         extras_require=3D{
> > +             "testing": [
> >  --
> > -2.7.4
> > +2.17.1
> > +
> > diff --git
> > a/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix
> > .patc
> > h
> > b/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix
> > .patc
> > h
> > deleted file mode 100644
> > index b373d93e8..000000000
> > ---
> > a/meta-python/recipes-devtools/python/python-pytest/pytest_version_fix
> > .patc
> > h
> > +++ /dev/null
> > @@ -1,51 +0,0 @@
> > -Upstream-Status: Inappropriate (OE specific)
> > -
> > -python-pytest: remove fetch during do_compile phase
> > -commit: c974fbf9ebf185552ab65301e07af44f36517abf
> > -
> > -introduced an issue by making the version 0.0.0 -this fixes that
> > -
> > -Signed-off-by: Armin Kuster
> > <akuster@mvista.com<mailto:akuster@mvista.com>>
> > -
> > -Index: pytest-3.2.2/setup.py
> > -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > =3D=3D=3D=3D
> > ---- pytest-3.2.2.orig/setup.py
> > -+++ pytest-3.2.2/setup.py
> > -@@ -1,5 +1,6 @@
> > - import os
> > - import sys
> > -+import re
> > - import setuptools
> > - import pkg_resources
> > - from setuptools import setup, Command -@@ -22,6 +23,18 @@
> > classifiers =3D [
> > - with open('README.rst') as fd:
> > -     long_description =3D fd.read()
> > -
> > -+def read(*names, **kwargs):
> > -+    with open(os.path.join( *names), 'r') as fp:
> > -+        return fp.read()
> > -+
> > -+def find_version(*file_paths):
> > -+    version_file =3D read(*file_paths)
> > -+    version_match =3D re.search(r"^version =3D ['\']([^'\"]*)['\']",
> > -+                              version_file, re.M)
> > -+
> > -+    if version_match:
> > -+        return version_match.group(1)
> > -+    raise RuntimeError("Unable to find version string.")
> > -
> > - def get_environment_marker_support_level():
> > -     """
> > -@@ -59,9 +72,7 @@ def main():
> > -         name=3D'pytest',
> > -         description=3D'pytest: simple powerful testing with Python',
> > -         long_description=3Dlong_description,
> > --        use_scm_version=3D{
> > --            'write_to': '_pytest/_version.py',
> > --        },
> > -+    version=3Dfind_version("_pytest", "_version.py"),
> > -         url=3D'http://pytest.org',
> > -         license=3D'MIT license',
> > -         platforms=3D['unix', 'linux', 'osx', 'cygwin', 'win32'],
> > diff --git
> > a/meta-python/recipes-devtools/python/python-pytest_3.4.2.bb<http://py
> > thon-pytest_3.4.2.bb>
> > b/meta-python/recipes-devtools/python/python-pytest_5.1.1.bb<http://py
> > thon-pytest_5.1.1.bb>
> > similarity index 100%
> > rename from
> > meta-python/recipes-devtools/python/python-pytest_3.4.2.bb<http://pyth
> > on-pytest_3.4.2.bb> rename to
> > meta-python/recipes-devtools/python/python-pytest_5.1.1.bb<http://pyth
> > on-pytest_5.1.1.bb>
> > diff --git
> > a/meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb<http://p
> > ython3-pytest_3.4.2.bb>
> > b/meta-python/recipes-devtools/python/python3-pytest_5.1.1.bb<http://p
> > ython3-pytest_5.1.1.bb>
> > similarity index 100%
> > rename from
> > meta-python/recipes-devtools/python/python3-pytest_3.4.2.bb<http://pyt
> > hon3-pytest_3.4.2.bb> rename to
> > meta-python/recipes-devtools/python/python3-pytest_5.1.1.bb<http://pyt
> > hon3-pytest_5.1.1.bb>
> > --
> > 2.17.1
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@li
> > sts.openembedded.org>
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
>
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org<mailto:Openembedded-devel@lists=
.openembedded.org>
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

