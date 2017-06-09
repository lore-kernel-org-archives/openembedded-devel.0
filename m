Return-Path: <mkelly@xevo.com>
X-Greylist: delayed 10856 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 10 Jun 2017 02:57:03 UTC
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
	(mail-cys01nam02on0075.outbound.protection.outlook.com
	[104.47.37.75])
	by mail.openembedded.org (Postfix) with ESMTP id 4DFD078038
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 Jun 2017 02:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=uievolution.onmicrosoft.com; s=selector1-xevo-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=GIuFfc5G441x9X5f1YlUHOxIJYpl+6vfC9EF3pfu3T8=;
	b=NreviYu6ch9l+I7UcK0RoTu4ZqM0uP6ZxEjXNFJXbnC5oHAOtVYjtC+28CIiR3SQmyOHdB219gneyDAYg97b35QyXP+RZudSmU/yZIZA9wS4sEvC3g2KIaW3SCDYrLES+XxuliSl7wHxb0C6K5OO/Sqjp3249RYmRFHFQHnnbZ0=
Authentication-Results: gmail.com; dkim=none (message not signed)
	header.d=none;gmail.com; dmarc=none action=none header.from=xevo.com;
Received: from [10.0.1.79] (65.122.179.226) by
	DM5PR0101MB2940.prod.exchangelabs.com (10.174.183.15) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1157.12; Fri, 9 Jun 2017 22:22:39 +0000
To: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Martin Jansa <martin.jansa@gmail.com>
From: Martin Kelly <mkelly@xevo.com>
Message-ID: <e0efb641-fd8b-a8ff-e952-7b32805cc45a@xevo.com>
Date: Fri, 9 Jun 2017 15:22:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
X-Originating-IP: [65.122.179.226]
X-ClientProxiedBy: SC1PR80CA0089.lamprd80.prod.outlook.com (10.164.136.16) To
	DM5PR0101MB2940.prod.exchangelabs.com (10.174.183.15)
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM5PR0101MB2940:
X-MS-Office365-Filtering-Correlation-Id: 0f2c02e0-570b-4709-e734-08d4af860b9e
X-Microsoft-Antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(22001)(201703131423075)(201703031133081);
	SRVR:DM5PR0101MB2940; 
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	3:1z9X1ONNDdJlKgs3lzSts83qekLLpH20mSsalh40HqtEH4pz7fVzU9f2QPs1hfpq2ZTsagzPI0NRfo2mGZ//vgn7sEdVsW6cAY1NQzvrw1lJ6Ugz49uRPSfRRBhhSeptXMgNxtJlu0WRxMFE2ROj7QdwQPbfddoOr5GzwCcu+b/2HFQZhyfuAaxPaRHPZRMXMlztDrRHEl1DX3JbFXNG7Q65CdstrPRlR8VAihUCJszQBr7+fVn7hnbjO1J01f2xmWH61zYfpbPJZ2fcJ1a0U3IcaSns4awZyvNxjhE+HdDRuhovl/SZetcPc0IAWhCjb0GubBQh5+cg0RHlH0GWOQ==;
	25:EKic4+2xfnFyLg/zJsUwmQDGjuFTdO4DQRQPBo/FMm2QmZ1Ht9q4qRsfbrhEUPODTeBsg81NC+uNjbuJWnXdyVHzd0CS0r+uu+DS5lqHkbirQ9VKO+np22y9WUR61hATDUAS8HjOuYkbDgBSy9OuMOvPkm79zqSGgCJGVPL9C+m/MFWNG4aLVSVJcFz4PItlxvxuFbtSzIgW6Ixgm7pelWlE8FfkwmUGWyzoclwtiGLAS9L1bo5oUUjZtBi5CdJRhtfDDyvSc0dIocq3KHtZJI7Ra+drWlHx3LbsYS2nr8/BR/5/SsubWSXW6KOet4W+4+5ZBmFjejAGNDWAGsmXF440PG68+HHZ+I9N6p2YcFsQRGdJFvzCcqC2mfR4T1T2pb6KZACTU62gqz70A3XurXNAaEfRp8lY5WE2FNQTAkcy9LJWvc5UZeRCmTceKXM1i+apvry5t9xYJyjWRdwqThdomyJ24L8eHyACIqFTNlg=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	31:iMoyqqFaJRePBg5nHpeHqyCVjLFSoLpjo6Jbn2gZdSRKo16T73vDkxaGM6COiHOYcaZsBlmr5YpDHcoJ2IVt4jb2YghZ7Dfh0XFciTsOf4ASAJacG1mDiCk8WpbYj9ocLXReqLtn5qQBPNkWUScKNqiRL+4ntHcwpkUFQ4BSWrR+7XhWRHeKngyLf8+JA37xIf6/tD9iDf4/pYdM5qoFsKQH9ssWHA+4USGObxL15OPfS7ezGrQ18PpHhc2QhOfK48YZ+AlUfQzhmJO90Wg9oQ==;
	20:uaGPeytw72o5PaR5ce2oWgCkLp+eCU1Z/yBDBYntLxA+t03sKoZfIYsXf8Hq/DQmZJXu+ZnnvpE7AatcFvoI+42rXpwJvnrhCafwnapEbZ88seyCE0jnfxriJTQZosP+wO7uH7sLO9dmgzFbr8w8eN5b54WHEIItTBIqfhavW6dlJuCUK+o3sUPf+YiUCc3/P59pvQCaL/kWeuPZNJW/DTkWDbUTuwL+scOaWfJukLPR3u/cAVTFs23nclDrW55NuLrSnwkrGUTLD2WBlcshbHPAdKd//ZOmtMxom/Z89s6pNH2IGCwu/YAgA/QKKHkgOoqX0wnMNanxNW3h98VN/w==
X-Microsoft-Antispam-PRVS: <DM5PR0101MB294088B9B262BFE764B85CD4ABCE0@DM5PR0101MB2940.prod.exchangelabs.com>
X-Exchange-Antispam-Report-Test: UriScan:(166708455590820);
X-Exchange-Antispam-Report-CFA-Test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(2401047)(8121501046)(5005006)(100000703101)(100105400095)(10201501046)(3002001)(93006095)(93001095)(6041248)(20161123558100)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123564025)(20161123555025)(20161123560025)(20161123562025)(6072148)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:DM5PR0101MB2940; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:DM5PR0101MB2940; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5NDA7NDoyQkhYWmtpZm5jbTB0VFEvNFFkS1VJQitP?=
	=?utf-8?B?NkQ2MnF0YldQZ1lqSUw3Y2o5b2ZsVnVydjBsWnZ0NUFON3k3aUEyUlFLVG9k?=
	=?utf-8?B?bjNqVVE1cjdONXoyTjNTTkJnN21qdEVrekFVbTFxeXJtYXUvcHMyWHdUV1Nx?=
	=?utf-8?B?K1g3SkZmc1BIYWVKWGhHK2htTVh2L0xPTnRDSmpNclJBa0VyUE5qWS81VHJL?=
	=?utf-8?B?NjBIYTBYbTJGT085aFh1NHVKYmJTUllXb3VibjdSWmhBVnZsMVJkbWZqUXlZ?=
	=?utf-8?B?dGpFdUNrNW1HSm1JbTVWWDRrbGpxT2ZUR1ZtV1NxYnJIZHFxbVc2Um1EY2tj?=
	=?utf-8?B?eEpXWUNscWVNMm84dVlCOVFYVzlOdTJXRHhZUnFsMTZoNFVvOG5QTHROS2VC?=
	=?utf-8?B?TnVWZ3NvOFprSnd4RjZpOHNnZEdLdXgxeE9aWURJeXhtSVNhT1NNeWtNY1Ev?=
	=?utf-8?B?T1JxM21PQ0lFQTJ0RzZVKzkxdXpUa0t3ZkFld25EQVFKZDB0bFJFRzBRYStu?=
	=?utf-8?B?eUljZnhHS0srMzk3dWQ0UHhoQm5pVWdTNGFHVWFOK1d1YXNHcXI0RmF5dHEr?=
	=?utf-8?B?N2pDMEgwR2ttdUYxaFRVbUppdU51Z2dXTGdmL2NpS0w2ekpEaFBRVkNHVGxJ?=
	=?utf-8?B?SmFLYjlWM2ppM0FrcjhzcWVLbzU1SmorYy9RbnBFZ3A1TkF3anI0eDRMa3Z1?=
	=?utf-8?B?a2xhNzJ2ck4zRWpFWEMzSHY2M2lpdzBOOEg4eU56SzVrd0ZqZ0w3dWprZ1Bt?=
	=?utf-8?B?bkluRTJFcGhGd2NXWm12ZWQrajUrdWVhZE90VVF5Qk9lUGliS3RISVBDTEgw?=
	=?utf-8?B?eHh3eFdEMlhkNW9DNUo5R3BHM1hMc1FqZXZBaVFyMlhxbnJVRWxCaFhoblIw?=
	=?utf-8?B?TFloZ2FHTm53U2F2eXNiS3lBeEhIanh1MHNlSmFVQU5UaEhjSHN2QlNrcFow?=
	=?utf-8?B?bTZnU3hwdHhFNFFBZWJhMXU0ZDJKbHJLNGYyaHZDeHltM1lDUFBKUXc4R2FF?=
	=?utf-8?B?V1M5ckhvZG1wUjNHTzJia3pmYVpBV1laZHpkOENaN2pvS1dJL0JvaUJzdThh?=
	=?utf-8?B?eDNWeXk1SUNHTFo5WStZOENsOGxRK2swOFhsUk9oeHRJM090bTMwYURuUjdC?=
	=?utf-8?B?bDNxREdXdU96TzBRUlM3NXlNek83cW9IemNVSnV6eFBtNGhiMUp3Q3dDYTFD?=
	=?utf-8?B?SjZ1VDVROXdleW45VmkwSVNnRlhubWxUbGlySG9hYkRzYmZQcmo1dDVHbWhS?=
	=?utf-8?B?ZUgyWEZkcnVyeTFLYjVNTVBGMDBmMFljM1RraFdpNXlSUFZLM0JUTHY4OXJF?=
	=?utf-8?B?bFE5Zm1UMmxxQUk0N0RnUy9ZdWM3Q3VwZ2VxY1Zwa1Jwem8zemRUQWJnZTVo?=
	=?utf-8?B?elJZMVBzM29QOXE1MTNIVmtrd3MwZnA0WlMxYU9pTWgzU0hBKzlVM05hZVor?=
	=?utf-8?B?RC8vcUtJQm5saEh6LzBNdTRTYnhraXJTTHNGdEMreXVhNEMyMzRhaStlR1hZ?=
	=?utf-8?B?NW12aUNTNmNNaXRRYkJHY0EzdGR4U0hFdEV1UEg5WnRHeEg1czBzY1VRZDJ3?=
	=?utf-8?B?VkNZNGFMNXc4bnJ1M2VOb3kvM2VaWFA4dUdVR2ptNW1QWXhDV0Vqb1F1ZERZ?=
	=?utf-8?Q?=3D?=
X-Forefront-PRVS: 03333C607F
X-Forefront-Antispam-Report: SFV:NSPM;
	SFS:(10009020)(4630300001)(6009001)(6049001)(39830400002)(39450400003)(39400400002)(39410400002)(377424004)(53754006)(42186005)(31686004)(65826007)(478600001)(5660300001)(77096006)(23676002)(3846002)(966005)(8676002)(65806001)(65956001)(47776003)(53936002)(6486002)(230700001)(86362001)(90366009)(81166006)(6306002)(66066001)(50986999)(64126003)(2906002)(6666003)(7736002)(36756003)(189998001)(38730400002)(31696002)(25786009)(54356999)(230783001)(305945005)(33646002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR0101MB2940; H:[10.0.1.79];
	FPR:; SPF:None; MLV:sfv; LANG:en; 
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtETTVQUjAxMDFNQjI5NDA7MjM6RVpiSTNSei8vTkZ1Nkg4VkE1bVVmaFYz?=
	=?utf-8?B?Ri9FR3ZuVXZVWW9uQUtwLzhqRHRhMTFEd3pVNE42NGJaZUViZGhOVnJDZnVG?=
	=?utf-8?B?WUlUYlJQbmhXMGg5em5QQVVrUHhiRnY1YzhQQmVaM2FtcXJoYURjRlY5dWVW?=
	=?utf-8?B?ZUxSdFgyeUwzLy8yZnllQnN4NSthM0lXNkNjU2hTVjhES0k3Q1RJTDNGeXVl?=
	=?utf-8?B?MU52dW1zSWxBMVZPU1NJbVNiZkNtMzdPdlUrU25xNEpUNEJvS0ovZUZZbklX?=
	=?utf-8?B?dGExSGFjUFZmMWxWQXhhUWozMVVNYUV1VHh0bFBQRWdFVGtuejVxTHcxOGxH?=
	=?utf-8?B?a1pwMWlHeUdJNXV0ODZ3VXBIUkVydFExeGRoeWU1OVVjbHdaRDNnS0NGMkRs?=
	=?utf-8?B?bC8zS25ZLzFMOUtiTWp3am1hTm80bm8zeEMyZzlxVlRpcE9DQzhNcU1oQWpu?=
	=?utf-8?B?YzFuU2ZwMk94MXNnMVBhSXVUQlpNWFNQdnBpRjM0V1ZwT0RUK2kxSkVIUGpS?=
	=?utf-8?B?QXorMm11Y2NKNFNXdkwxeVBkc3hlZ2lLZWo3aEtyQ3lhdWxIbmZlOWdBc0NZ?=
	=?utf-8?B?eUlVNUtMUC90ck05U0EyTllMejVabDhSUUx4R2tWU0x3K29GRWRncU9MNUhV?=
	=?utf-8?B?L2UrYlUvQkJ4M0dqSC9PdDZSZUJjVithNUxKUVNYc09xalgweXh5eXBSRzNG?=
	=?utf-8?B?bXhBem9yOW91L3RzWU1Ca25HQ3h4c1QwaVFwaUdjOUluN0pkWUJKU0I5L1Nm?=
	=?utf-8?B?bm11b3VuWXhDamxFeHFGbW5ySjAySEVqU1M3SUJ1YkQyOFlmdDJ3OHlzWUVa?=
	=?utf-8?B?aWlsMzBUSnRvc2hQbkFuSXJKSVc3V3I1Z24rYzNlS2J4N2wzQitaT29xMWd5?=
	=?utf-8?B?UHh5TmFEM2hHRlFBS1BOdTN4WmhKdU9GWERqVXJxK2MvQzJBQ0h5VUVlclNE?=
	=?utf-8?B?V05QaFZIZ3p3VEpQSE1teXlUNWlQMmZDM2xnV2VnSlQvbmNMNGhRMXRBR0ZQ?=
	=?utf-8?B?V25XSmxvcCtudUlwQ0UvRHlONC85aEVCZXJlRVFMZVVlRmUyT3YrbHEwQjU5?=
	=?utf-8?B?eWNzY3pPc05XMXhveU9zOC90Tll6ZWxKMEhBU01NOGtZV0FvTDg3eisrYWpq?=
	=?utf-8?B?QW9tVG9lSmhoWjh4NC9DaUVOUWxjUERpQWZSK2Z4VnV0eGgwUnJUTk5GcXg4?=
	=?utf-8?B?WSs3SlZ1bEhBYkxxaVpOK0ZFcmlLSEtUU2Zva3JubVpzYXdIZG81TTBjQXpY?=
	=?utf-8?B?YUMrVU5qcW5EZ1dwM0IrN0dpWmxpcktRRmVIS0xHMlJQM2F5RW9uU0N1SkQr?=
	=?utf-8?B?WU1SaW53T0lBaEN5TWVMdy9QMU5ZdjcvbnAzSlAvbDdxcFp5MW1maHRaS0Zu?=
	=?utf-8?B?WTk4dWhobHZmRG5aa0puRGFHS2M1YnFTYmxSUUhhdHR1R0lScUZNR21QYTQv?=
	=?utf-8?B?YVhXaDdHbGtQb2pCQVl3Wnl6bHhjbk42TFF6dExCelcwNi9YK0V0S1gySVRw?=
	=?utf-8?B?TUJMY1h3PT0=?=
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	6:JXyObLuqRDkAnlP5yrFjGCBFIiBI4U1yPHu/hte6xtVVLrN14BvZatpJ6detXvlovfgnVvz0RKEySHphOeZrtFE5K1jVQjolviJsFv/70wlqKDz4Nc1RPgOCfwXKMgzskOi8gs0fJPo1xZSewUzflU2Vfw6/ZnPOKsES+md0HQYydaeZncdAiMjdJLtDmOsuuOzUujY/t+AMfelJ+/d/4J5TtR2iS0abFsrq4iLrdYSfxsosqmZsYhHHvclvuLXFAL67XlPkJGsMSBJM296Gh8FgpxucEMTugpv5sc5TnDK8f+QC6Q551TJER4IQdbQC9bia8sN9ZAgl7dMhgV7fQPs4M7fdgT6Qp/kx8rc3FIFX8scwxCtXgTbGouLx0VFO/Uvo0uEP/QNpcq0OFFtznFJXdoWeVbXcBV9vLSh2LhvfKiK7RFgVXcTdBKzxP4heRt2JwlZHQo7RaRWUlIfR82q5AeCEPsb7TYiiyo1v5m4oqk4gF0Z5NXIISzpm5pBdrTHw12lxv5DB3OzVKD95cQ==
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	5:2F/sahTkr6IKhfpO6Xh93raylh5uyOh6v6tyEW9LQi52rbPStOuZeJiBLsx4QyKpVzYmUqRn3vu3qqJURMH3KMUEjTv6jm3Z5EkKXPIUHRhJ4F64P4FmZQOFmxxEaMbaCU3YxAhtXvWuB/4UavffJ8VTu9sCkDcSQdwevc+ph/blSe7z5nznYcDAn6aDPy6qwJFO9M9QcQNUi9SRn9u1jbaOeYCXwcKseQUf8WA0BKGiXzmx45B3gaJV4PiQF0rTy+RiG4XrjTuS5aZEOu4Y/GtazYXVUki2KW2PQHVfEbXyrVBUILld0Wsv31sPBdyUKOsyECay1l7rxvGJepnMe6pS9JozJq8Az48kMEaOKctCYO5XHbVKaZzFQmULXS4+Uv82rB/4Kx1glgSju8x0N3+Mt+Yz/kOMrm2nGHk0eE3Wb1aW8fzgrr0bVvdPmhChEnY43NQIksaiJf6UQKSAVRkq8fEx38andozZb/zPsfeZRr4Zw6zCZJE0KE7lHivA;
	24:9tRGXF/sP6/27C9nXvNOFqGpQ0iYCW33Y4JrZVCVEGcV2PEskj4ki0hfsR8AlMbhXVP+7gavX49ORMyLzI04c9PAe9qPumAmg3SfGHEmcf0=
SpamDiagnosticOutput: 1:99
SpamDiagnosticMetadata: NSPM
X-Microsoft-Exchange-Diagnostics: 1; DM5PR0101MB2940;
	7:fexymraMv9fG0S51MZs1vp4MnK9a/uDCqT7QYngIU+NrPLM8k+7Oyva9bauvDcn6ORKsHq5GQXBFJ/flJTYlGCq9Sc0lphtdRDI5fTwtnIS8zg88USvA8xsdkH6VXCPMlg+RUdHT4kduWuHWQMAZLHiz+nDJJJSI8U72ql/IPwz2wDFIt/jnDLhgzry9UJNhIYDrOQ3GwQNeQVik+HFZy8MahlKGuabUpq6XkYLzuLdb/QL95TSuJrFsjjvjM+mze48eZEfdjTWZYH81LD6rEaJFKo4CVCh4ogXTKEelukcgzjUiwQUhR1uo9gXKqjpNEt4nNEhovQezPK/d8vyoZw==
X-OriginatorOrg: xevo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2017 22:22:39.8878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR0101MB2940
Subject: [meta-oe][PATCH 00/14] new recipe: open-vm-tools recipe
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
X-List-Received-Date: Sat, 10 Jun 2017 02:57:04 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

This patch series adds a new recipe for Open VM Tools to meta-oe. This 
recipe is invaluable for using Openembedded with VMWare, as without the 
tools, performance is very slow.

More information about Open VM Tools can be found here:

https://github.com/vmware/open-vm-tools

Please note that, as mentioned in the first commit, this recipe is 
modified from the recipe originally found in the Open-Switch repository. 
The first patch is directly from that repository, and the following 
patches are modifications to it.

Original recipe:
https://github.com/open-switch/ops-build
yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/open-vm-tools_10.0.5.bb
Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9

Although the original recipe packaging was Apache-licensed, I received 
permission from the author (Diego Dompe) to relicense it under the MIT 
license for inclusion in meta-openembedded:

https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html
https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html

--
The following changes since commit 41cf832cc9abd6f2293a6d612463a34a53a9a52a:

   Revert "rrdtool: add gettext-native dependency" (2017-06-05 11:13:09 
+0200)

are available in the git repository at:

   https://github.com/XevoInc/meta-openembedded

for you to fetch changes up to 402d1b3917195beb2ab7cac5dc94aaed8992b5a1:

   open-vm-tools: style changes (2017-06-07 22:31:34 +0000)

----------------------------------------------------------------
Martin Kelly (14):
       add open-vm-tools recipe
       open-vm-tools: add missing pkgconfig dependency
       open-vm-tools: add missing glib-2.0-native dependency
       open-vm-tools: clarify and expand licensing
       open-vm-tools: base_contains --> bb.utils.contains
       open-vm-tools: update version to 10.1.5
       open-vm-tools: don't use mspack
       open-vm-tools: don't use dnet-config
       open-vm-tools: add #include to fix build break
       open-vm-tools: add missing X11 dependencies
       open-vm-tools: remove kernel module logic
       open-vm-tools: line up configure options
       open-vm-tools: support FUSE
       open-vm-tools: style changes

  .../recipes-support/open-vm-tools/files/tools.conf |  2 +
  .../open-vm-tools/files/vmtoolsd.service           | 11 +++
  .../open-vm-tools/0001-Fix-kernel-detection.patch  | 35 +++++++++
  .../0002-configure.ac-don-t-use-dnet-config.patch  | 41 ++++++++++
  .../0003-add-include-sys-sysmacros.h.patch         | 33 ++++++++
  .../open-vm-tools/open-vm-tools_10.1.5.bb          | 90 
++++++++++++++++++++++
  6 files changed, 212 insertions(+)
  create mode 100644 meta-oe/recipes-support/open-vm-tools/files/tools.conf
  create mode 100644 
meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
  create mode 100644 
meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix-kernel-detection.patch
  create mode 100644 
meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-configure.ac-don-t-use-dnet-config.patch
  create mode 100644 
meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add-include-sys-sysmacros.h.patch
  create mode 100644 
meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
--
2.1.4

