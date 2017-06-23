Return-Path: <mkelly@xevo.com>
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0075.outbound.protection.outlook.com
	[104.47.37.75])
	by mail.openembedded.org (Postfix) with ESMTP id 2EFE178217
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 22:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=NL032ESv3P+TVZNP6euCPUoaaq67TDy3bwfmD9sqpKQ=;
	b=dnRvQ7jJacfQmBnWMUIOURIjXpTA5KBWUu7ZQk5Agdg8xmZcwFLsG9/wl0mBkp6vLrpoGz5YwOVxK8oF0GvaGoP5chodLrcPDGzqRQkYW+ChtZepE5yszq2WDzlKJXKF/mCS9JQswt7rz7Qj4qXFTlibnxG1j26IoCEhzP6jMgs=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:08 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:48 -0700
Message-Id: <511a37c6562debfd7c36b855aa7fcef7b799c1b1.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5c1012e-a335-4975-8864-08d4ba8a0f44
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:WMroTROWjXHAEFXGPoiNB704RFiCVx4wt86ret00Boe29RzZtk3NYChWFm3h3RvD27IxDljYlpLEeMuBJJV8V1so2CQPLon7O+dW8yIhB2R3CaaDsWVVxAnFrIQY3Roj0k6I1XuoATina94CutwKyNpXYrz9w2xu1EwONyPcMcCSbThy1qMFotvbOQB8uQIkIDIzdgPT5paflOPmGMQDnXdPgB1UNeJwHZdd0AViRPXhEH3e4pGGC0CrrgBm26i8ktE+KCZgb04X1EKv1TmiRvu6SWFxgEkP9xOMQhl/x3Y+0Li8jJ4Zr5LWoafNZgevRHBrtcdxdGGs7kLDHIJQ4qVsXYemMiC2C55DTXPqhVRkfhl7Lf9VxgTiYHC4LWKynNQENOz3M1ve4rdepy5/cKUGh+q/QTP+zwSmg5on2EHGr4gNbdP87d2fnM4FWlrfmVDAdR9TWAxtds+MNVWUtBS4NK2HRhFKCAmTJ3H8O6AYccBVWF6JZQ0Al5FFvkbxDtRMz0JMF8S49fDsyeVBehA2KxSS4Xnhe63UBPDNJAFPY1fD9ztXS4jRXqVjdPuCgzK5hXF2+0I9Mu8EKbcNcwGU4gY6PnUP7Xuac3ja1FkA5k/cpDb8aadVH8p9BEODXAseSJjPrm4g13hkDV9u9ijPLVfuMyR5sxZg5yu8sAqkLkZmBkxuPuV8FeHAKF+zy+WkpnXhKeAmKpMk+QmIE3nfbU8Jomuch1fD0XnpQCs=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:4WseL06Ob4flsuY9ElMOQ3MI9XLBDvz5KVNTXFnxRnl0buPusToInw33TudtmcDKxwo7hgDtu6B7UKpUVYpwEjwVCQDPqckn+i3ohbGTQ/IndYztDTGBAN9JMxt02euD77Op/buEW5mumYjLQ2NA+1FN/3FyAXXGHee3LlH1OZYmz+drtIpf2H5+MKhtVY5bHNWwnCLm4awcsHjgf3aeDjhsGs38llIDAuU59nf4CacFRDNFwX0QmJHalPJXilfk4ONWZusCBoy/ErpolVyOySmRt+uHH6IqX45GA6PfGl22nXrFDkFzetB3/jaR1Hww24yoGJD2sNZTMcQyP/BNkMMpLSvvZWA3sjPzbnlzqWbN9ldQB+F7V7vbNfzDPXAejMmBRK3Gdomyz90befSvZGI2/BR1oIJniuSqBOq1g+/UwF+5nQLQZsbdF9ITXA5cIG7wMfR42s6v1Krty2EzfHJvQGxxcerrLrHVmmipYRbK5QIo33U8QdYuNTm4DlY/lHu3J+eSdiTfhhnvvMYP1vs3Yff8xT21GGM8ugHnINoYlCxlq8qlS5bICthAy+dPZKt68wkqdYGpxeV9zDlo0m0b09DRDLGS7AYGNCtFCH7uWEOrHIqKH/biXtY+ecUFLiUfaKQKmOMuISoMdP9QZB6jI0Z/PdlPNsVU2q4oQwsu+0OeUfIZIP+L6/A2YddAf5wbTcVwhg0FvsR4HYkS/WmtkyXf+WHF/4EqVu13py90ofsrPiVaD6eH73njjNOx7IK8hTd9/MSR3EpwoDg7dPd/5ouK004ojXcoHPBPB63H81BBeb8UhqrFNf074O/uLI4V0l7IjgDlklIXqkXj8mqQ0JE/i96tubUq06JatRciMIgkU9yPkmfmV0WarnbiwPXVs1hHLAnh7WUEX12Y8wDc0D131PrBA0ujh0kAywI=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:1ON0ulVpOPE1p+ZNrDCkv6WGdn2uYPqHkHpaS2XWENOOShOLz9YxUKW5nwRnc4cE02pEP+sNrmp+qhBAZ90pt4h6f5xXTFIYpUa6SBXBJi2EXJCVF4EX/fcBaV/30V7EBm/YFAadKJ1fd34dSsbB5mCXLhYZ+H+9ody5xf8wP7woQ4/mXx+VI7SL4JGzusAgZKOEdRVYQBK6YS5yAXkdfiU8WISa9aZohixVxDLDzelK5A5PK2uQybD54yJomhpJQ5/MjSE/k5v6UxHD4UDwDKxcA52qqxD+t0azDJrEGtH1IQdjOald6uTUPvu6kTJkYKpBFsF1G3rC36YG0WmZvD0AxJ3dDxCGNUhCNdiU58fGhNkVjiCkk5WTZXVkwmf+2mVvQC0R2D+vg66Kuxjer+zyQJFkmBsd21GNr89p6LnaOoR1gKfeHMJr1Zu8bfHMhdxUVuT3c4fOAmXs/wuw3M7PTMnHmFWviZ/5Ug2+i11RZNqL5maGb3aOi9XuLhm8iJkNTdHSo/8PRnUjewacQX2meojSrOWJJT1Ra4pBYgLc70x8bDMjsA29umTlbsnippaRj3BCCjjjj7L738AlkFLrJUMlrxSgO8MTNr6ZO+fBjH7FaXCIAXt8q+4z34qbAaUdlzDU0n3+1qFPQb7vjB/pJ3BFUDRXMqe28vOw6no=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:j+7jJhI1PhevxaWrIbA/uhOnKMATf0HSEdrdmQ6+QYR7+zNIEHr8VHj4jAoL7PRtBltBQN4XGZlJAGV6iovg66Jw3UWdkwYxwMEN5DJbyC2wngQIzCM5SbwFxe7ULu1prfT2hlyizo021aOn1nAtd+OO7GYFUEAj7gbfx1H7V+xACxAVB/YxlkvWEc7p8x9IXOox+JM5CHjVaAWjGrziL0zzUldsChuYkIErM2CRCkPpIpANRKMoliSIub1j1mx8x7Vm2dzw2h79iCDvxxdkVsFQkRycYGviKGjvjNrcd+HWnLSLX/O5o/9/scS/yPXEUpoCF0F5jnq/SKB3dgbEqw==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB29352C601FE3D15763543F3CABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(236129657087228);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:KSKorY+amqZrEDCQKVQ1FPXLU96195ySCnX59MUi?=
	=?us-ascii?Q?vhbKc8JXPkMNCXHWqxaejcYZ2Z20C3WKT2PYoZ0oUax+/LIKgBVkjqsVG75k?=
	=?us-ascii?Q?UGD7jBwvrIsqoCVTArV6aFG6rlIdIfU7Te6HMsANIBjqkOC86GPuHL7j8US6?=
	=?us-ascii?Q?xCR3HS9mFU5X8f3OSJpC+0PCBgo5rChx+CmfhX0Mu2hFDXIz8ND8GL2HqahL?=
	=?us-ascii?Q?mzcjLzjN8hkv+RG1ZlNNPkXtvuBwHb/6W8bFSYSvMRC66x7/fwGV5Qp1mo/J?=
	=?us-ascii?Q?jNvmPXVYdLe3Q/IjyhlxDdL4sgvRJ4cCI8I5cFzbO4FMrDRRMURZo6b2EYOM?=
	=?us-ascii?Q?SseuHBXDdHxwbx7i59qeaW0ezspq+5IrXI0EKHO1cdUq7WJiBt407htTGBM9?=
	=?us-ascii?Q?ukAg94nlQS7mATfNMSZ1pNPucw2bhi+XApGxXGyUbYQW2Lo1+KU1+SkcgDFw?=
	=?us-ascii?Q?KCngDvh14Men0WnkYcN22dENpBoi1C55i9iMr9lfTcu9y9ne7cwKFno1LL/2?=
	=?us-ascii?Q?HA1vzJGxx0Fu/CD1oVQuuMAYCf+u6ILNQz3y7Fj46crni0aXVsAGib7C93XE?=
	=?us-ascii?Q?vajKrN5TIWsSW8rEbB4qZ6sXG/Ffr8r5ugvwJXqi13XsDVJqmo8bOXiiPDjQ?=
	=?us-ascii?Q?I8NNaIcmlrKItiYFzayS/XdRAQfL6IWsxKUKZWBXZscWZWs+iBNkiBP5+M9D?=
	=?us-ascii?Q?FwVMUpnvFYw7wUqIWkJ0MjL+kyzhB8jd2sK++RLxfHOu0rObfVD9/bHzdLC8?=
	=?us-ascii?Q?I/5pYdp+DViwL1H19Esr0suOw5BLOrwOANcPf7WuyXVNkIJZobyFTUF8oDaK?=
	=?us-ascii?Q?wWguL5B3ecA+DVn5cvaajCum2w/oEVtw22nn0smKDL+/zbcEOCqYPHXWnb9T?=
	=?us-ascii?Q?YNLt5wt0O1phZbrpTrkAT7iLFFnvNSkJKeNnfPPdS7bFJ9YXaahfVcG4eqiQ?=
	=?us-ascii?Q?4g39HnRBeI0Tn3ZR6Y0qANF+2q5LvyullsDTZeT7Gx6K8qq9eZGZAVydhy7t?=
	=?us-ascii?Q?vxAa+xrJnFzO64NawBXmfejVF96OGFdPwydQWkl6gUWa1gEIyzSYp7adYJuW?=
	=?us-ascii?Q?5HnqowDyxyRlLPMIOdiC+6ktjeySUYNVGbLd3+RoPYyCzZRnBY18RTrXPUdL?=
	=?us-ascii?Q?2GVijIAT2q6JuC2voIM8JUsoUDpipCX/uIAgI2KDVEP+RSHXqFDw8jmPhWwR?=
	=?us-ascii?Q?lTEV2YHbhDIl7cU=3D?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:krkN9XrH/R3OunY1BtFg7voAxX+vSKR/ZOM80S8?=
	=?us-ascii?Q?VmrLEkAp+CAk1FP/0iPEYt1/EdYGnZ1xtG+JVrC+c23KZREISfStmettMI71?=
	=?us-ascii?Q?dS48nOYCt0SMNwl02k1yZDciuH6b/j4TU0U173A6Z8O15j6Xs1UH3nvg84gn?=
	=?us-ascii?Q?/1xPbLt0owLLSNoz/zNBrcCjGwNBirxwOR904mlaRaimtLCPo4jKU1mztbuU?=
	=?us-ascii?Q?WJRkI5fckGZrvM1eivCGqfU+TR40AU10I71zI/s20aEhdTOSbRwdRvSO4cPV?=
	=?us-ascii?Q?wJXL2MSTCW4piuMsBikEeMDfUQvpCvn0FEckWGb6NFwQNsn8hfkRhffHquAV?=
	=?us-ascii?Q?btS/CY45VuZErxJ0JWUvnUcEIgC+7niiDBk4QvQ9Y1IM25GhEpnklNMT7GV/?=
	=?us-ascii?Q?fNF4PNUeKxWpQBNKpMMNa/IBUvJy/8WzRhnmly9Dq2YZ86ooPMkofUOIC9DJ?=
	=?us-ascii?Q?ps8oM4squVf7s0oz30L/Qz2BTMRcBTOi0oEFr5TdM0xRP49KgPV9RlA8UUCX?=
	=?us-ascii?Q?VX6LFneIuUjo1US1OwJzn0/nkyuVSaWX34fFW3j3aT9TIVY7Pz7kfix/eObZ?=
	=?us-ascii?Q?1Xa4XmaO2JGYAvPQlopKnRB1Rr59R/XQXxqpvSsWDmmEac28xg/Mc5JCBLfJ?=
	=?us-ascii?Q?nfFChL/kR75NcaYQvkqr8/HhYAr3VqKmEm96yCRvzrP0GCPKgQhqEM+GEcMf?=
	=?us-ascii?Q?EO6csSeUZpv6cFddgT5k6O8Z8bWWZAjfZw9GqHHAnnw44TaihVN1dSnjwZtH?=
	=?us-ascii?Q?3seJMn3u6QrbZdIUfBO600tK06s+iXEDAHrOGMoqaJm+Denc+jdTz10XqE+W?=
	=?us-ascii?Q?lp1nFKNfO0wsCdSY5b7A5NmPoLaG010L0kFbh0n6kWJAdg+W22Vse6kOezU/?=
	=?us-ascii?Q?hZG6J0C3+Oxr9CtM3JGa6csTc4eF6+vA1Oj/muLGFGGIjJsqTfcr9i0ddLnF?=
	=?us-ascii?Q?AlRlXmaXKHa7S8VwW4Zr7gWMjzDPK6kU1E0+PnFlg6rRpCoInEt1tc9/thCw?=
	=?us-ascii?Q?dEhMZ5YZkVQT9jDPPXxsGKZLAfv+1j25wONGHM4P3WNiCUCYROeuhBLilLEi?=
	=?us-ascii?Q?aRkvFmFFq35wlokYsi2lODHMUjiKyk0q+nn0+o/SiShwusPJU3A=3D=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:qNyKR+9lxrylrtANT5kLa6fvKhh+rqi1NnNsvjgi?=
	=?us-ascii?Q?0QvgBasb/KTaWyRRnDl900OkuLYxqxrTX5j+7xolYJZ+8cVgFPfJYKzQrlST?=
	=?us-ascii?Q?JzU7RcEcZo+3wbP0F3xJWxH57JDyMU7OPVz+tGveDwPYHNMWo6fz90fkpW5w?=
	=?us-ascii?Q?g+BQJ63VM9Zx0Ki6ky8wsXfcnpPFBBxEjWTUoxQ9oq9fYdU+wZ7+xZS1RAtt?=
	=?us-ascii?Q?4viP7HvbNplgE1KLj7GhzGQI5KrJlmeCZpWB8pQH4wmUnuTVXxokIIl0QILu?=
	=?us-ascii?Q?Xam/1ZPzMXRR49dCgXBqYqaEWMINpnNQMj+oJXkSeLFcCRLyoodt8/BKyoEj?=
	=?us-ascii?Q?lbESYEem24hRg5jhh7ZJYfMaCBjSN6IFzw+XpBHoLmF1Qt9EdDmZ2xMtlI4D?=
	=?us-ascii?Q?qyBvUiVSmwQ5GfCiX9YXc2ISqvECxM4tkrfnocpO9zyVnfhJtGM97mORAZjc?=
	=?us-ascii?Q?iY3dCN6rDGc7EANLjbKIlBdM61STcr/ynff984fwt6gL1qoRnD1/Fd2wLZ21?=
	=?us-ascii?Q?CBN7g/3CGdBBvOAYDM0Z9oNyAYFnrCu74+yuCTxLT0nMrWzuaPMmM/BpqlwT?=
	=?us-ascii?Q?GqosdDqf24OLU6y36S1JoC1R88+AlMRlrDT4s5pmOp0iKYE6ktCP/mceBGYT?=
	=?us-ascii?Q?ZDPlafz9afY/WSsbv9M952x2RJzMzWpqCJfpbL/xb6G8PuwKh2Ssa/rMUWGH?=
	=?us-ascii?Q?D3dtP2ggRQc4VvDAWShn9B3PAqgFcPqrir0zaBlqLWjK52yYxFGahqH1+mT2?=
	=?us-ascii?Q?XM5NcGtf7TcPhqs0JmLXu/tSDBVV3/aB4yC88ZjsFh1NnKKHRVgyoKmg59yW?=
	=?us-ascii?Q?SJd2RtDHkS65xAORogQR9xCUJz2bWyLE+FpS8Jprcsq0HnEnsH/bqqAvEaDw?=
	=?us-ascii?Q?ywnaV6YSIWixKmN/ryeC75feQBW1fT03RqbrzWSaEtrTdjIazzYXkQqzWZ9K?=
	=?us-ascii?Q?b4A/AuUDm5MY7WWcmfm7ldDORr8CA0XgAMthfK/VSOIF/KycL9CJ3Yt30fLH?=
	=?us-ascii?Q?edc=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:AJett8KeFgObVIRZV2S/VoBn1TOiy8BcV02weDMP/dNnnBneBNVm22JMha5lXqnq8mLd3xOEIk4jG5qK7ipI1GEGH5oo+eA/gZtNCLaInthmUTa/4s/8Iw7GnLsxI4JG4Vmx4ai9YdyvcXMs68/ZLZfWYAkB6NC8B3EKx5MO+2QurF6VGovj+dF6rnddEOrdUmQV+eTCqMBZ/uBP5zDhX5T6vjv0GzDAJrBJN3VwaNHzzzJmfjlqPNw0FjyyxZ2lde0k1tn7fM0BI1wHA2qv1B30ElGF9IiCBEGHClBHmnp5WhDUAiFJ4L7vh98Cw+85WCEjoUo+tfLxRlF8VtcfZcXK1cWcWrBvp0wHjthb37WkKQjfvIQU1F8zxVn1gsmOxx9r2b1HAC6MFDQhouuq4e0VW0LwtKcw7L45SL+sTTc/Rx4jij0eIUAI9Yest83WOZFhjUZy2+Tm9vtBIuwrc+uzYlLnSiM3GCjh8cFXijHmvbydJFvPUXLD+09cIKop;
	24:YMNoYJuZTLiqMRsZqcnVlixWZpIB5B3n9SXivvHGz4J1biX2A+zm8Omp1Q5b+pCXgLAa6I+8A+9K4jCCJ1NyzUB4amoDAor8sCZPxqj4u4Q=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:0MEEt8R0ckMKwrdi80KMWrULhKD7lAzpig4V1aQ9diVE5fPnKb6gQKDW7qrz6m2BHyBaJcwAjyoQbBw2fG8F00BmpRmOMG915l6xJdomnCuNYQUg+gotxUHwlKM58x19Nl7BICwI0EBoKNf/5DIg2kXThwV2EiEVnUC0A16czI5t7B67glaGSRF3+ZUeODAHK4Tcj2NkPTmjr5eD9LaA452m7NGYT/UOp6ThpgP3Jsyeb7mdj52dXROSCCqElRbju28G6IXPDd/56vbOtLfIpd1ZcF4v50UBhI06mQ9KOmOixt1kTqer+SB4R8I1YyjTIEux2cOlJ13lkNWc8le1zBVMvJNLcfh1pBbc1i2BITRN7+RlQ6JQln+zBV0bq2Vt9aODcI4TWEatlEf6KqD3lraof3w18dczz0rqpYtOYqLID43DIz8sgUFQxVRUvDM0UK+R5dxgbgcN94V9mNy/lTgdLAQ42WChA+3YTBmIFuRTAYHYbhSaETi/fDRke81T2FC7NPoLuq8kGo3twawgLKk3UdVC3qO9SK+jWaBL1kDF1KA/1w7h/9hfSwFbUA+1+FZlCpJrG/TmKzHEDYxEis8SeTSBtqXDdUmj0/HVRc+V+LpDSmkoP5JleezzoETJlZHH526TuYTuKbwNfnzWsgZqeqZ/aDmFtTXidxwlwp+OsBxmrU+Mhun4vjxF4HSt5ZOUW09ErQ53LUEev9OYCnOfyOZvjaNxTWIhpAhAA9D6qKH4JSSS57KWfgf6aKJ3ekFYBU0Z0RlA2jOcxbXhQvli1OiSWRXH/uJFvHkm2tc=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:08.8674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 17/17] open-vm-tools: remove -Wno-error
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
X-List-Received-Date: Fri, 23 Jun 2017 22:49:08 -0000
Content-Type: text/plain

In the past, we compiled with -Wno-error=deprecated-declarations, but
the current version compiles fine without it, so remove it.

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 2a83e864f..65fbfc9e9 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -53,8 +53,6 @@ PACKAGECONFIG[x11] = ",${NO_X11_FLAGS},${X11_DEPENDS}"
 # fuse gets implicitly detected; there is no --without-fuse option.
 PACKAGECONFIG[fuse] = ",,fuse"
 
-CFLAGS += "-Wno-error=deprecated-declarations"
-
 FILES_${PN} += "\
     ${libdir}/open-vm-tools/plugins/vmsvc/lib*.so \
     ${libdir}/open-vm-tools/plugins/common/lib*.so \
-- 
2.11.0


