Return-Path: <cdgarren@indesign-llc.com>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 02 Nov 2018 14:13:58 UTC
Received: from mail02.indesign-llc.com (mail02.indesign-llc.com [207.67.30.40])
	by mail.openembedded.org (Postfix) with ESMTP id B618F79E82
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  2 Nov 2018 14:13:58 +0000 (UTC)
Received: from VM-IND37.indesign.net (192.168.10.190) by VM-IND37.indesign.net
	(192.168.10.190) with Microsoft SMTP Server (TLS) id 15.1.225.42;
	Fri, 2 Nov 2018 09:58:53 -0400
Received: from VM-IND37.indesign.net ([fe80::e895:bfb4:ee53:4249]) by
	VM-IND37.indesign.net ([fe80::e895:bfb4:ee53:4249%12]) with mapi id
	15.01.0225.041; Fri, 2 Nov 2018 09:58:53 -0400
From: "Garren, Chris D." <cdgarren@indesign-llc.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python] Flask Dependency - "No module name pkg_resources"
Thread-Index: AdRytC6PVVxWOTeDQhy1QYBhX4O0KA==
Date: Fri, 2 Nov 2018 13:58:53 +0000
Message-ID: <00a09c46438840ad854cb430ed3be71a@indesign-llc.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.40.114]
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-python] Flask Dependency - "No module name pkg_resources"
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
X-List-Received-Date: Fri, 02 Nov 2018 14:13:58 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I'm working on creating an example application using python flask. However,=
 I'm running into an error when I actually try to run flask:

root@imx6ul-var-dart:~# flask
Traceback (most recent call last):
  File "/usr/bin/flask", line 6, in <module>
    from pkg_resources import load_entry_point
ImportError: No module named pkg_resources

I was able to fix it by adding ${PYTHON_PN}-distribute to the RDEPENDS_${PN=
} in python-flask.inc, but I'm wondering if I'm missing something that requ=
ired me to do so.

Any help is appreciated.

Thanks,

Chris Garren


