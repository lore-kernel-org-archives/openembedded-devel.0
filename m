Return-Path: <mkelly@xevo.com>
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
	(mail-co1nam03on0079.outbound.protection.outlook.com [104.47.40.79])
	by mail.openembedded.org (Postfix) with ESMTP id 990DD78213
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Jun 2017 23:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=lsEVznnesKOwzMCHmyyUenF6bUvClUSjBczl90TzT/0=;
	b=GLmucRGT1+4ADFllZ3SxKI7HDuvOYXQUkRTfYEHao7xMmJaqLLV3uWq+h/wF4atvTar1KuWerioWIpbVeKSqHFImqUAUMLeo27imUXPe0rznI8ICBjaTIsHgvFOMZtTUAiuKl8a6FHTQKfo7d63xlC0GMy7Mzg9Eu45tTsmy1PQ=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none; lists.openembedded.org;
	dmarc=none action=none header.from=xevo.com;
Received: from columbia.surround.io (65.122.179.226) by
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1199.15; Fri, 23 Jun 2017 22:49:02 +0000
From: Martin Kelly <mkelly@xevo.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Date: Fri, 23 Jun 2017 15:48:37 -0700
Message-Id: <c18f0731dfccb354eb1b169b7a3c0dac3e93500b.1498257745.git.mkelly@xevo.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1498257745.git.mkelly@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: CY4PR08CA0055.namprd08.prod.outlook.com (10.171.251.148) To
	CY4PR0101MB2935.prod.exchangelabs.com (10.171.223.140)
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3bb5a580-63a1-4822-73c7-08d4ba8a0b7a
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500074)(300135000095)(300000501074)(300135300095)(300000502074)(300135100095)(22001)(300000503074)(300135400095)(201703131423075)(201703031133081)(300000504074)(300135200095)(300000505074)(300135600095)(300000506060)(300135500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	3:p4j8ZYMPboF5jXb9oledX9CIl/kXZTm2lpDpqlW9q0ZUEU/+TqEe7ND6S9Zv4dBdhYiu0ONRlr8VtrrX/F7RzuSZzRhpL2fF273N2lI1y5B1dvBTBYPMfNKcH6vWW3sK9ltHqfNCMfRl/Lz1s+gn1aBNASy+Ocu4DeMamU5B9eChAaIjX4IbSHUjA3EEu/m7XuyszS3t1dwAwDbbwaQxbXOCN8HB8RY0T/f981PAzFJHiuaK1TXxs/T9whqb6fcl01Olo9THJBSigjvul6UuhhdtBmp6NTNHBfhq/ug1E0KPwrJz0yoqV5kG+jcOx6yH/Jrwt3C6E+iI03CPtLIm4TWX/zTkrVsntDLSKVCfcaKXD1iVGOu7ZGEU4B0rzmj+6ppVqoSJ7FXqr4prRfGqIU2ClZj9kzSwG8ZSpteytV0rzJVuWPGlZcjFr20SxCuiUNAcNDr2v31rnLA8ILyNbMFjFuYzg9t36nGqMMOefZLL8fUklYSM4F4QP1eLucv8KG7Q3yXSDga3/sKRyxlu59j6J70lQzq+2li0uu9zNqqBYTQejsAPyxrI9p/qd9oClH5Ki7Z0+NN5uviSBeGuZvpr5JwH/5ZAw1kJyXjsrKcNvycw7/hBFEj33wvQ80Xz0VEWA0V3SHDKvlKT35V67rXGhKMQiCbKdeiJ4bhcRg9t/1i+29YA3txQke+14vkJ4exjWsXkjZlV9cSHmBJpKOkduZ05chl2EGrKS3cI9vA=
X-MS-TrafficTypeDiagnostic: CY4PR0101MB2935:
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	25:j0gzxIs+5A+WZzJO1boqZRsVnujsAKhe/havgNtxNrh81KOZkFJGQZgW2aMrAprPOCh+tuLDbE1EiI9e6hL0gwGQFJdSfFFR5grzuf74VsoSSGCGzK94v0DOZ1emba75lZrmsn8z1liPrFX//wBlIj+UCaMFWNnzY2vzDl7M2m7otM1xJxKVR/S6TOC7su48VJPAeWIAop/tQC2xojOU677qhuzI5F1qHVDcYKeNhMPlFa4q+ojvawzLM6r5WUOF69JTiAlV5veVXIPgBso9+Di8zDcOiYaoaacvxf1WMtxdjCG7gATh7BFhIxTJFj5jSk9+uMzo6wF1IvtnIPboInaRm8VW8GQ9cvVWJXJVwpeVxT+a0Y8vYnAL3zTBZNZ1wjZCG1Gg5YwBLj0lpVC+AgUf5XYyo0wJPIWOYLB3V05TqU1/rBXzKb4VPCXuw62yP/d6ukzcnEN4Usv+HerwqhSZF22hKGO/3aO6HMjuH1uJ5r/Cgrw2Uuuf1Pi0ahz/M5e0m/udMBAd7NEGhLMX+VJcPi4+GvKBFyP7x5YwVxHV7cqZlc93pl9S0NHa5xy+v19njYZE//zl655C1bVKYgkO35apafCdSocGjO7QOq5ugOeQNozn6smuhAwphKD8OQKGJ2Hdl288urqEagr/B9tbeM2y+3F6YxggGk/mFea7SCdgGq68ru5F7ghQP4ED/9IsJUx6iZ3nxJYsMFUYlArvPhayqvPmiO3jHTv6uQpYSOf6w7+PLJZDP8XRQMegXv6CR5PqoR9oNeav8OkP6j0JZ8skMVYCRFHJnTTl45qAp+KQF6W+vBcZGw5SDAeD8HP/I22borbope1oi3be02vNx6X7FkEe8HuAQ3+xHwaeWrr5UprAaCd0mOxkjIrsH355RwC5Dyzw1LTRQyrDnaduHFX6NsSAEXhEUwDB2y4=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	31:l3LvUnOj962D5TiVnPx9uQeAhn7AsS3m39b+ndUpn5XCKwMXE2/x0/R/ciIL7gy/YfeDIZpOA8RSlJxBONEZa06NLJpAtaoUawbkxqb1jSLMuQrNRa9Ow6FUq3XbkYTsWuSjSqlboyhdzyWaEJp26S1v00vZgM8Q8vkNh6NlCalvQKG5o2dBTZLdIQ0v2OL834gXu78ia5jP2v7Q7AVTXN3+z/03Hof536N6kNPFRM81jijZp4gbPhUTY8EpzevOg9sgTh3FYsXp4jg0wHO9uwT4shPdHo2j1dXQU+xfqwnSFdtAfg6yYId/FAN8crFvHAYXinccK10NJq1FrNbG5nGTV1Rfdj3Diiy8faAVVMm9wxIniWvRj4NwSEKMPHo88xEw40MAhob1INr2LPl1E6shoTw8QymYSZNdtT428k148hDBy4T3GHVklMuJFE4DMP3CSvPye5UUsTNS2OxQzHvQrQmB2Zdon5je/UoOQu3Vep1mTGZGpmg2y71b1Otwn2L68j5d4NKqN3ixYDPHbporCMd/mUyE1XFIGlJG/scOm+6alIdzrmZCyV8tcX46HGBL2CnepXtQlN/Y5JxopUTkeTyWg8ybDjwfyIkjwrtN0qnKB5GOdZ6Rd2b4d2UMZGKDWNtkxSbkALfl2Cf5p+QdxeNtNBzMwjurSnrk3SA=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	20:YsTHR54c54Z1QLo2PgyR+MmtTe5H49oI7TkVOvdeAASP5XYTszLUgDUeItZlnSUlA2wyT3gl4wcC+gquQjYn24mQbPKZbGToMEdSKC8PyZw1f7r3lHYeom6Zt/ieXxz62ncjv/QvB8uVaIVaV07aEgD29M2+IHWgMs5t8lDXhrkHQL4vwzx8bc0oHW4BKcOHOIdeHbjZyYl80wcjmCE01J8mZxPjD8EdQSsuOsAARXFTjMOhAj6FJepQAB7qR8HRNjJ+AUK2DFPNSEMEDTfYPAAz9dpXHrLN7COTsN4sw+C2otrCPaind8QBlXv+toa/1V3Ongoa7ZR+DnMj4QXmDw==
X-Microsoft-Antispam-PRVS: <CY4PR0101MB2935F43676BDFF23E4DACDE2ABD80@CY4PR0101MB2935.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820)(167848164394848);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(5005006)(8121501046)(3002001)(100000703101)(100105400095)(93006095)(93001095)(10201501046)(6041248)(20161123560025)(20161123562025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123555025)(20161123564025)(20161123558100)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:CY4PR0101MB2935; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:CY4PR0101MB2935; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	4:mdjgctncvkribkCAEuVqX+Ofvakk9LUmb83H6wTC?=
	=?us-ascii?Q?klYQa+XZTutf6OzFFTSshnmc+G59KbKLBeGYVk/uh1hvei25un+cYXbEe15a?=
	=?us-ascii?Q?EV79NvHz4yHVpGAWxKgQRfY5zdd0vsxlwmqdTNYT6kbcpcRZ0Buh1g9Taxpi?=
	=?us-ascii?Q?qSVyI+S10QxIUQb88L/ZaJGckUVDjBBWHxyG1cj0EUxYOIh7b2BH37QDL5w7?=
	=?us-ascii?Q?39ixealgiB+boC1nKIUcVZGDeaeJ5vsN2d1i/Uds2yMcrWZ6z907zq/HeSJ6?=
	=?us-ascii?Q?E8T9r+fFdEvKTZfj52QqpQyu13CazuaDlZr5rTndDRE2HEnPmZa4El7Qx0XJ?=
	=?us-ascii?Q?QivmSCHoa14vqv8WKczcgpfYWm/2QmdSRDZApIdcAuTEEpaErphyYxA7/VHX?=
	=?us-ascii?Q?l27kvbOclG4+l8YvRJBMTLkVw3QPbpTA19cOdC7kRJlTXOtkNYB1WqTHMI4N?=
	=?us-ascii?Q?cmlCa8GzhAKNBjrtYd6sdjRtIsG8iVmMJR9y7McFHSO4VOJ+ILNM8GUa481O?=
	=?us-ascii?Q?b7kMmBlNN/22lc4U99MkKw4TvPZQ+nsHCGupBITaCnTQWUKPDvrYEuZus/1i?=
	=?us-ascii?Q?CTuBWIaHb3ZCyV8d5ajMuJkOmLVVdJLM8+SfDjBbPVRq4cvbOxoqo67hB/H3?=
	=?us-ascii?Q?4j58j1992D5+Qmuy+wrJHMmIvOnp1IsMBqwxyv/FrlCIWppbZ/h5PqUHEbpt?=
	=?us-ascii?Q?rhpdzyv2ZIDmuRTSIAQhbWlxJg9BWLUaP/DZzBFvRix8J+nD33070UiXzRBV?=
	=?us-ascii?Q?UbPcN3yBjJ6/pFV4dkbYSG/VdX/afxfJ8IWFn7ko5GQjJn+ykgQAubdrKBPb?=
	=?us-ascii?Q?O93HtjgJ3agR3WuZk66Qed4JoyeKZzLhyHZ/CvMfuy9DNvozDrxOANGFrYoC?=
	=?us-ascii?Q?3S9mZritP0yOtFwDhiiy6KoVLOWIZGxlieqVsQX75d7KAb4UssWDdMexcve0?=
	=?us-ascii?Q?20tQDCuK63hWJEFnKD4O0gkKmdck0MlzH0GIDSDAWiFDBZsTR7Q/jnEWKDHg?=
	=?us-ascii?Q?z1wF2TZXGTq5EiCwhIfgox8Ub3ruRHtdVksIrLadSwyYwZZ+j+tLQXmEP25D?=
	=?us-ascii?Q?8LeelCUzaO/Nb4KGLs22fPgTuFx3IA+D8YUuBWgXwONsWBnHrds9J97+IEh1?=
	=?us-ascii?Q?iKT/5G2NO0zfhAM/t9XcNdx8Y4bSpHL3wjBApJ22I2K9xY91u85MI3kMZXQw?=
	=?us-ascii?Q?fw2ixyZh40GlyNf1cLomRQuiSCRxP2nIsDBl?=
X-Forefront-PRVS: 0347410860
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(39450400003)(39410400002)(39830400002)(39400400002)(5660300001)(50986999)(53936002)(33646002)(5003940100001)(76176999)(8676002)(478600001)(50226002)(42186005)(47776003)(53416004)(66066001)(6666003)(2950100002)(118296001)(6506006)(6916009)(86362001)(575784001)(50466002)(189998001)(81166006)(48376002)(36756003)(4326008)(6116002)(54906002)(3846002)(25786009)(2906002)(230783001)(110136004)(6512007)(107886003)(6486002)(305945005)(38730400002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:CY4PR0101MB2935;
	H:columbia.surround.io; FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	23:PeuMdZ1IlCjjsiVsowfVIU4jCdnLoS21WHu5RYx?=
	=?us-ascii?Q?AbVLP+5p2SJ0TuV5JZkkFjwgEQr1U4/85HZ6oKdDQSingHSaFnwHEjPCv3Ct?=
	=?us-ascii?Q?D6Ugq5PInNZtBsmBpXB5yJ0FIYNpFG2hABL2p79+X9t3CiPXzGUmHqs4zIMY?=
	=?us-ascii?Q?LgRg2QevtUUqrEkst4N2XZRAfLztdpmxswcjuMnSaR+fQrArzag+Wl9WLi9Z?=
	=?us-ascii?Q?P4a4XU+eJwhcGSXXyJKo/bXhbi58E9ACmLYlb91TZ7t5179G/6z8dMnJW5Qq?=
	=?us-ascii?Q?17IGVqbW8gJrm9VniJSwbUtyQdn2Ji7QHrhivWns7wmsEV382IyfxIMMU/dk?=
	=?us-ascii?Q?ojzDTe1QvcTmJGb5e9At8Ffd2VuykeiycfGNc8vz+1VAZQKsLoAWOXw565qG?=
	=?us-ascii?Q?azJWmaLVrbN5Ze2pcq1nvIeL3ZYIFYBbUWItxt4OIj8eaT2mK4smBHSCmoTz?=
	=?us-ascii?Q?23hpzIVc+yc43ghARgtQcgYt4yL9DOXy+xeElHApBXSsV5BfPV/taav67mRV?=
	=?us-ascii?Q?sZ69W76wJJUVFRJn6GiVeZtrMFe9mlEEkOpAHeSVUIRSPF/1QoGJkHCRLOgs?=
	=?us-ascii?Q?pXKyUqnhO5NaS6ZAqMsttnfg/M5YibF03efFTDRktQ3O5gonzIDmowi1wo+X?=
	=?us-ascii?Q?JGxn0pF3BRHrsqOOcZHRsNjm9DACeNfO75b8v++nYzdOi0REN17yAYuWIa65?=
	=?us-ascii?Q?oR15uhxCZDTof10clyD2J/4CY5BkbzE//k3jv7hcPSQndJ+1ajJ4DCJa/Ng4?=
	=?us-ascii?Q?RbkDl3NlmZPWVXk0VORYcYsEG/B/4Da6XtsS+ioxaOU7um/Pwm3ahiqOBOw5?=
	=?us-ascii?Q?cucTNm+X8damRMy2qcnhHSjnfchtdpasY04XwxWQXL+G39kfP9P8xeQmvtGp?=
	=?us-ascii?Q?rWV/+xrL+th4AaQok1maGU85ElVChGmTNhAIJoXW1AJBXhoAi1VmmKz7dVGx?=
	=?us-ascii?Q?ReZFXRMLDNwvhKEDULQdgwhLazy5XxENF+hI5Khlqj+oCDPjz7X0sKv8jaKu?=
	=?us-ascii?Q?DMyEPGxXU1eAkQo4MmXYMHnUhVdsdCprBDL0o0cxmlPPo5gRtassjtyJ46fp?=
	=?us-ascii?Q?ibcQbfwZJwdkxdfz5Fe/ZsmCUKNtAalPNvBTiy9EPGFVkZbt2alBxcr6AmtL?=
	=?us-ascii?Q?hwqSdOjOhrfQ=3D?=
X-Microsoft-Exchange-Diagnostics: =?us-ascii?Q?1; CY4PR0101MB2935;
	6:bY/Sho0r0S2VEG3fPNSzo3V7EtoAz8m4TXKXJUVO?=
	=?us-ascii?Q?W1NlSlS5h0C440uGxL2i5eTXOYrfYLwpAQ/g+VSi7XGm+DgcoiJYcdTBipyo?=
	=?us-ascii?Q?R2kZ2f7bEW2rmB77bLPJL57wPBloJJvNwZq6g99PxKlQ9dyo6jnN+5X3k1IN?=
	=?us-ascii?Q?bIIc2KFaxW4HZ0/bpvX7+VXg6Hfht94vl/qyv6vfzsS/ClPwuS0ZUV6Lx0Ld?=
	=?us-ascii?Q?dIP4wZhmqjOKNBoOD6uajzvHkc3qxSFskLllMPasKvep+rXI8kMwyAAO5ajE?=
	=?us-ascii?Q?ENemDWH/qvORuXuvnBjnxNiL0IkVchQPdcAGqeo5iO31azXXn3J8FkWJUc+D?=
	=?us-ascii?Q?cBldDzfRytKrJHUe87SG232azFCAKFXI9wRFoaIfG51eya0pDgCFFNb9Nh/A?=
	=?us-ascii?Q?OqUBLPXMxRewe+qc9Tcm3cTmfJczC48FQ821tQziTDO5CPcwZDSkrel+KN3R?=
	=?us-ascii?Q?5S589+If2FW6zTb527yeYm0hglNE/UGPBo8CrGSsiWfGQ1Wv7i6P0YNqMufC?=
	=?us-ascii?Q?fq1KcqdBgttDlRZykEVVVBt69C6ygzF2XGmtTVhi3MTwvvQqHXlDAk/AEdnI?=
	=?us-ascii?Q?gRboSQ+flhLIzgZnERssWk2wUlPDDia44TFd99Hl4Zv0QvDf40S1P3cx9qtV?=
	=?us-ascii?Q?Ae/BnMnWviMRduME210G7xjgYZ9o78l+CADkiFbrTA8rLHO4aH0sjC5HXv4r?=
	=?us-ascii?Q?Cg9wkQRj8fow5Aj1XwoHE9Ur+dTMqOfaK8PzzjQsfA7hzN1QtkwipwkPBarq?=
	=?us-ascii?Q?324r2ftKi60IoyywlcQeygw8BmVsqyhtHl7+ibM2WwqNKkbp3ryLztPt9Kfs?=
	=?us-ascii?Q?oNg7+BwqOKZ20/1AioDPdHWcHVGghSCq47YaDsTXdhnftqxhET4PN5VXmFzD?=
	=?us-ascii?Q?jr9UsvTBHbAZhHz3VkH39Jnt5dMyo6pOaA7TRsf2soE8lHBNmisOO4crev5b?=
	=?us-ascii?Q?Juo4qZtj0nQVh+z2WG/xU6w32xXD4dfHLuiwIWLgcQbnLMdVNgXb4u1VaqyB?=
	=?us-ascii?Q?poU=3D?=
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	5:Ho+9a3MkOSDCWBc7I06P9Pf0SDUlqBE0AkOS/C8C7nMtXFdV/3Jla77VcsTXkN6zdd3s4gj+vjvBeO/PZWwexeCYNwV56PZQmlLaIrCQg8W+z/Iz2J2hASMqu3iCuOLPqOdiH20TIZ9oCOQfLLIKzqI1Qt50ChiuVa4oM6Nobo1ClkFU8OHHpqvNwDpsc1jWazENV4y+zd0JupvIpclrxuijHpwVGmjvINY6+6kiVvuyhlqxIrh1Luu7Ga95xextz1eUFWyshMjm+2yKYIDqxgY1YTdda4nUvRs1Z4WwFRNkTuHy4MJTX0yKwI6sY1KUdPbXi7On1bx0N3N1WSJmNy4HCeps9AGCSexFCadwwXPcBdQmB7hG4xS8WsRvfUmdjcUdUun3AA+FNZ8BPafxOmDPEMjil6qSfwrQaQeRt66MG5WCS8s2f1GWm5dvKwkmAY0ZBQzbieZRwUlq+ajlj6mKz2OnagPyMXc0elKPt41ftfXwI/AJOU+H3ZHET+ns;
	24:zjMbgOuFXZGhtunivAW6trud58DQGasc4h/OrwMrMXZIHgNN7VfuPwfbQoXU6/LcuS+oaMwAvniB4CwVBPpDEWqriKvzYgqmmC+EGA+pbug=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; CY4PR0101MB2935;
	7:jUb2eMQE6J+OTjfo3T8mHXlYJTmJyqtLV57U368UIcjMYVZ8ZSrKz3ouu4ce2O8iJGgy3mESK01OQlXQWLVEfXYMxkZSmmg8VFmmQDBw8zXyEgdr2AAXPHo0Xr48QWtQoENEtPdUrqTeWZaabHGlpNMJKmeXz6zOv90+CZRr38MTgNqz6byoRN31h4HzffJPdgSyE/+6ZLthw2VhiHdpw7txgQnN55gLebIVoNErg8MxBlT5ZN0sBCSBhvmqs6CI1bxFqSuVH7fDnYzXYYVJB62OmjF/3PHFFR22W4dFfsypgnZlxLcvTwg/usNnVxF/VAR9CStaEJvVH0t5pz2eiSQ0CWeeHVp/khYqJblLOA2MW2s/Pp7YdtvETx3iW8Exrz9sZuWTBRxU1Clk0ALba5kpQSqfDN/wc6rWGE6uC6ByhIeDp8OfKDAN+klnfyxusTaxA2BQNNR/46f3Q4/E7O7oEDXLfTQsHvYkABHTJEYiwNgtj+BSYLWLOxaC6jQrysSHb1y5AzeSYFrq9GRtnWDjvA3YYko6Uurv2TgEEoW90QV6mEVBi9TFof52BdQ7YBotghPxksszSy2PTNayNW4C6NY3A98+3PmRO718Y4yLLve0zyoqIROfXuS4cd1sVENwD2V1c+c4+MPH7bn9uElINmF1visGD8sV9IQRtx2I3GcE/sq79qqSoEND3zbOY1SlP8VfcwvH7AMIxXsc9r2zJlBE96R5EHOoqZ3FqiSYU9t6n/em6A+BDKilpvDb7gkOmX12rA/NfrR3cPgzMT+DqbdDYM5oeg/ZEh7xqy4=
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2017 22:49:02.5098 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR0101MB2935
Cc: Darren Hart <dvhart@vmware.com>
Subject: [meta-oe][PATCH v2] 06/17] open-vm-tools: update version to 10.1.5
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
X-List-Received-Date: Fri, 23 Jun 2017 23:04:53 -0000
Content-Type: text/plain

Signed-off-by: Martin Kelly <mkelly@xevo.com>
---
 .../{open-vm-tools_10.0.5.bb => open-vm-tools_10.1.5.bb}            | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
 rename meta-oe/recipes-support/open-vm-tools/{open-vm-tools_10.0.5.bb => open-vm-tools_10.1.5.bb} (95%)

diff --git a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
similarity index 95%
rename from meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
rename to meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
index 9db43b0a1..8a71cb3b6 100644
--- a/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.0.5.bb
+++ b/meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
@@ -13,22 +13,20 @@ DECRIPTION = "open-vm-tools"
 SECTION = "vmware-tools"
 
 LICENSE = "LGPLv2.1 & GPLv2 & BSD & CDDLv1"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0eac46f0b7886425d7faed6aae5aef66"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b66ba4cb4fc017682c95efc300410e79"
 LICENSE_modules/freebsd/vmblock = "BSD"
 LICENSE_modules/freebsd/vmmemctl = "GPLv2"
 LICENSE_modules/freebsd/vmxnet = "GPLv2"
 LICENSE_modules/linux = "GPLv2"
 LICENSE_modules/solaris = "CDDLv1"
 
-PR = "r5"
-
 SRC_URI = "git://github.com/vmware/open-vm-tools.git;protocol=https \
            file://tools.conf \
            file://vmtoolsd.service \
            file://0001-Fix-kernel-detection.patch \
            "
 
-SRCREV = "538ea037a1549b6fd4e57529f7448a3fd2aa47af"
+SRCREV = "854c0bb374612f7e633b448ca273f970f154458b"
 
 S = "${WORKDIR}/git/open-vm-tools"
 
-- 
2.11.0


